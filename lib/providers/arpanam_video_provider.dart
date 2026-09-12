import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/services/api/backend_api_service.dart';

enum ArpanamVideoStatus { idle, compressing, uploading, uploaded, failed }

enum ArpanamVideoError {
  pickerUnavailable,
  invalidVideo,
  compressionFailed,
  uploadFailed,
}

enum ArpanamVideoSource { camera, gallery, files }

class ArpanamVideoState {
  const ArpanamVideoState({
    this.status = ArpanamVideoStatus.idle,
    this.file,
    this.progress = 0,
    this.errorType,
  });

  final ArpanamVideoStatus status;
  final File? file;
  final double progress;
  final ArpanamVideoError? errorType;

  bool get isUploading =>
      status == ArpanamVideoStatus.compressing ||
      status == ArpanamVideoStatus.uploading;
  bool get isUploaded => status == ArpanamVideoStatus.uploaded;

  ArpanamVideoState copyWith({
    ArpanamVideoStatus? status,
    File? file,
    double? progress,
    ArpanamVideoError? errorType,
    bool clearError = false,
  }) {
    return ArpanamVideoState(
      status: status ?? this.status,
      file: file ?? this.file,
      progress: progress ?? this.progress,
      errorType: clearError ? null : errorType ?? this.errorType,
    );
  }
}

final arpanamVideoProvider =
    NotifierProvider.family<ArpanamVideoController, ArpanamVideoState, int>(
      ArpanamVideoController.new,
    );

class ArpanamVideoController extends Notifier<ArpanamVideoState> {
  ArpanamVideoController(this.bookingId);

  final int bookingId;
  late final BackendApiService _apiService;
  final _picker = ImagePicker();

  @override
  ArpanamVideoState build() {
    _apiService = ref.read(di.backendApiServiceProvider);
    ref.onDispose(() => unawaited(VideoCompress.deleteAllCache()));
    return const ArpanamVideoState();
  }

  Future<void> pickAndUpload(ArpanamVideoSource source) async {
    if (state.isUploading || state.isUploaded) return;

    try {
      final picked = await _pickVideo(source);
      if (picked == null) return;
      if (!await _isValidVideo(picked)) {
        throw const _InvalidVideoException();
      }
      state = state.copyWith(
        status: ArpanamVideoStatus.compressing,
        progress: 0,
        clearError: true,
      );
      final compressed = await VideoCompress.compressVideo(
        picked.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
        includeAudio: true,
      );
      final file = compressed?.file;
      if (file == null) {
        throw const _VideoCompressionException();
      }

      state = state.copyWith(
        status: ArpanamVideoStatus.uploading,
        file: file,
        progress: 0,
      );
      await _apiService.uploadArpanamVideo(
        bookingId,
        file,
        onSendProgress: (sent, total) {
          if (total > 0) {
            state = state.copyWith(progress: sent / total);
          }
        },
      );
      state = state.copyWith(status: ArpanamVideoStatus.uploaded, progress: 1);
    } catch (error) {
      final errorType = switch (error) {
        PlatformException() => ArpanamVideoError.pickerUnavailable,
        _InvalidVideoException() => ArpanamVideoError.invalidVideo,
        _VideoCompressionException() => ArpanamVideoError.compressionFailed,
        _ => ArpanamVideoError.uploadFailed,
      };
      state = state.copyWith(
        status: ArpanamVideoStatus.failed,
        errorType: errorType,
      );
    }
  }

  Future<XFile?> _pickVideo(ArpanamVideoSource source) async {
    switch (source) {
      case ArpanamVideoSource.camera:
      case ArpanamVideoSource.gallery:
        return _picker.pickVideo(
          source: source == ArpanamVideoSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
        );
      case ArpanamVideoSource.files:
        final result = await FilePicker.pickFile(type: FileType.video);
        final path = result?.path;
        return path == null ? null : XFile(path);
    }
  }

  Future<bool> _isValidVideo(XFile picked) async {
    final path = picked.path;
    final extension = path.split('.').last.toLowerCase();
    const videoExtensions = {'3gp', 'avi', 'm4v', 'mkv', 'mov', 'mp4', 'webm'};
    final hasVideoMimeType =
        picked.mimeType?.toLowerCase().startsWith('video/') ?? false;
    if (!hasVideoMimeType && !videoExtensions.contains(extension)) {
      return false;
    }

    final file = File(path);
    if (!await file.exists() || await file.length() == 0) return false;

    final mediaInfo = await VideoCompress.getMediaInfo(path);
    return (mediaInfo.duration ?? 0) > 0;
  }
}

class _InvalidVideoException implements Exception {
  const _InvalidVideoException();
}

class _VideoCompressionException implements Exception {
  const _VideoCompressionException();
}
