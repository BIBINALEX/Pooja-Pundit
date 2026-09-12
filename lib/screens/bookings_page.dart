import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/core/widgets/app_confirmation_dialog.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/providers/booking_message_localizer.dart';
import 'package:pooja_pundit/providers/arpanam_video_provider.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';
import '../providers/booking_provider.dart';
import '../widgets/booking_card.dart';
import '../services/localization/catalog_localizations.dart';

class BookingsPage extends ConsumerStatefulWidget {
  const BookingsPage({super.key});

  @override
  ConsumerState<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends ConsumerState<BookingsPage> {
  bool _connected = false;

  Future<void> _confirmReject(PoojaRequest request) async {
    final l10n = AppLocalizations.of(context);
    final shouldReject = await showDialog<bool>(
      context: context,
      builder: (context) => AppConfirmationDialog(
        title: l10n.rejectRequestTooltip,
        message: l10n.rejectBookingWarning(request.service),
        cancelLabel: l10n.cancel,
        confirmLabel: l10n.rejectRequestTooltip,
        isDestructive: true,
      ),
    );
    if (shouldReject == true && mounted) {
      await ref.read(bookingProvider.notifier).rejectRequest(request);
    }
  }

  Future<void> _chooseVideoSource(int bookingId) async {
    final l10n = AppLocalizations.of(context);
    final source = await showModalBottomSheet<ArpanamVideoSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(l10n.videoFromCamera),
              onTap: () => Navigator.pop(context, ArpanamVideoSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.videoFromGallery),
              onTap: () => Navigator.pop(context, ArpanamVideoSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.folder_outlined),
              title: Text(l10n.videoFromFiles),
              onTap: () => Navigator.pop(context, ArpanamVideoSource.files),
            ),
          ],
        ),
      ),
    );
    if (source != null && mounted) {
      await ref
          .read(arpanamVideoProvider(bookingId).notifier)
          .pickAndUpload(source);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_connected) {
        final controller = ref.read(bookingProvider.notifier);
        controller.connect();
        controller.loadPastBookings();
        _connected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingProvider);
    final controller = ref.read(bookingProvider.notifier);
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final activeBooking = state.active;
    final isOngoing = activeBooking?.status.toUpperCase() == 'ONGOING';
    final videoState = activeBooking?.id == null
        ? const ArpanamVideoState()
        : ref.watch(arpanamVideoProvider(activeBooking!.id!));

    ref.listen<BookingState>(bookingProvider, (previous, next) {
      if (next.alertMessage != null &&
          next.alertMessage != previous?.alertMessage) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(localizeBookingMessage(l10n, next.alertMessage!)),
            ),
          );
      }
    });

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        const Gap(12),
        Text(
          l10n.availableBookingOpportunities,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        const Gap(8),
        Text(
          localizeBookingMessage(l10n, state.connectionMessage),
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const Gap(16),
        if (state.active != null)
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(color: const Color(0xFFFFE5C4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 13,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.currentActiveBooking,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(8),
                Text(
                  state.active!.fullname,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(localizedService(state.active!.service, locale)),
                Text(
                  l10n.dietyPrefix(localizedDiety(state.active!.diety, locale)),
                ),
                if (isOngoing) ...[
                  const Gap(12),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: videoState.isUploading || videoState.isUploaded
                        ? null
                        : () => _chooseVideoSource(activeBooking!.id!),
                    icon: Icon(
                      videoState.isUploaded
                          ? Icons.check_circle_outline
                          : Icons.video_library_outlined,
                    ),
                    label: Text(
                      videoState.isUploaded
                          ? l10n.videoUploaded
                          : l10n.uploadArpanamVideo,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  if (videoState.isUploading) ...[
                    const Gap(8),
                    LinearProgressIndicator(value: videoState.progress),
                    const Gap(4),
                    Text(
                      '${(videoState.progress * 100).round()}%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  if (videoState.errorType != null)
                    Text(
                      switch (videoState.errorType!) {
                        ArpanamVideoError.pickerUnavailable =>
                          l10n.videoPickerUnavailable,
                        ArpanamVideoError.invalidVideo =>
                          l10n.invalidArpanamVideo,
                        ArpanamVideoError.compressionFailed =>
                          l10n.videoCompressionFailed,
                        ArpanamVideoError.uploadFailed =>
                          l10n.videoUploadFailed,
                      },
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
                const Gap(12),
                FilledButton.icon(
                  onPressed: isOngoing
                      ? videoState.isUploaded
                            ? controller.completeActiveBooking
                            : null
                      : controller.startActiveBooking,
                  icon: Icon(isOngoing ? Icons.done_all : Icons.play_arrow),
                  label: Text(
                    isOngoing ? l10n.completeBooking : l10n.startBooking,
                  ),
                ),
              ],
            ),
          )
        else
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(color: const Color(0xFFFFE5C4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 13,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Text(l10n.freeToAcceptNext),
          ),
        const Gap(16),
        _AnimatedBookingList(
          bookings: state.available,
          isBusy: state.isBusy,
          pendingBookingId: state.pendingBookingId,
          pendingAction: state.pendingAction,
          newBookingIds: state.newBookingIds,
          onAccept: controller.acceptRequest,
          onReject: _confirmReject,
        ),
      ],
    );
  }
}

class _AnimatedBookingList extends StatefulWidget {
  const _AnimatedBookingList({
    required this.bookings,
    required this.isBusy,
    required this.pendingBookingId,
    required this.pendingAction,
    required this.newBookingIds,
    required this.onAccept,
    required this.onReject,
  });

  final List<PoojaRequest> bookings;
  final bool isBusy;
  final int? pendingBookingId;
  final BookingAction? pendingAction;
  final Set<int> newBookingIds;
  final ValueChanged<PoojaRequest> onAccept;
  final ValueChanged<PoojaRequest> onReject;

  @override
  State<_AnimatedBookingList> createState() => _AnimatedBookingListState();
}

class _AnimatedBookingListState extends State<_AnimatedBookingList> {
  final _listKey = GlobalKey<AnimatedListState>();
  late final List<PoojaRequest> _bookings;

  @override
  void initState() {
    super.initState();
    _bookings = [...widget.bookings];
  }

  @override
  void didUpdateWidget(covariant _AnimatedBookingList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextIds = widget.bookings.map((booking) => booking.id).toSet();
    for (var index = _bookings.length - 1; index >= 0; index--) {
      if (!nextIds.contains(_bookings[index].id)) {
        final removed = _bookings.removeAt(index);
        _listKey.currentState?.removeItem(
          index,
          (context, animation) => _buildItem(removed, animation),
          duration: const Duration(milliseconds: 420),
        );
      }
    }
    for (var index = 0; index < widget.bookings.length; index++) {
      final booking = widget.bookings[index];
      final currentIndex = _bookings.indexWhere(
        (item) => item.id == booking.id,
      );
      if (currentIndex == -1) {
        _bookings.insert(index, booking);
        _listKey.currentState?.insertItem(
          index,
          duration: const Duration(milliseconds: 420),
        );
      } else {
        _bookings[currentIndex] = booking;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedList(
          key: _listKey,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          initialItemCount: _bookings.length,
          itemBuilder: (context, index, animation) =>
              _buildItem(_bookings[index], animation),
        ),
        if (_bookings.isEmpty)
          Center(child: Text(AppLocalizations.of(context).noBookingsAvailable)),
      ],
    );
  }

  Widget _buildItem(PoojaRequest request, Animation<double> animation) {
    final easedAnimation = animation.drive(
      CurveTween(curve: Curves.easeInOutCubic),
    );

    return SizeTransition(
      sizeFactor: easedAnimation,
      axisAlignment: -1,
      child: FadeTransition(
        opacity: easedAnimation,
        child: ClipRect(
          child: SlideTransition(
            position: easedAnimation.drive(
              Tween<Offset>(begin: const Offset(-0.16, 0), end: Offset.zero),
            ),
            child: ScaleTransition(
              scale: easedAnimation.drive(Tween<double>(begin: 0.94, end: 1)),
              alignment: Alignment.centerLeft,
              child: BookingCard(
                request: request,
                isBusy: widget.isBusy,
                isAcceptPending:
                    widget.pendingBookingId == request.id &&
                    widget.pendingAction == BookingAction.accepting,
                isRejectPending:
                    widget.pendingBookingId == request.id &&
                    widget.pendingAction == BookingAction.rejecting,
                isNew:
                    request.id != null &&
                    widget.newBookingIds.contains(request.id),
                onAccept: () => widget.onAccept(request),
                onReject: () => widget.onReject(request),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
