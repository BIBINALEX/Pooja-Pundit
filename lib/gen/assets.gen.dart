// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/images
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/Apple Default.svg
  SvgGenImage get appleDefault =>
      const SvgGenImage('lib/assets/images/Apple Default.svg');

  /// File path: lib/assets/images/Google Default.svg
  SvgGenImage get googleDefault =>
      const SvgGenImage('lib/assets/images/Google Default.svg');

  /// File path: lib/assets/images/activity-tab.svg
  SvgGenImage get activityTab =>
      const SvgGenImage('lib/assets/images/activity-tab.svg');

  /// File path: lib/assets/images/arrow-right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('lib/assets/images/arrow-right.svg');

  /// File path: lib/assets/images/back_rounded.svg
  SvgGenImage get backRounded =>
      const SvgGenImage('lib/assets/images/back_rounded.svg');

  /// File path: lib/assets/images/birth-day.svg
  SvgGenImage get birthDay =>
      const SvgGenImage('lib/assets/images/birth-day.svg');

  /// File path: lib/assets/images/birth-star.svg
  SvgGenImage get birthStar =>
      const SvgGenImage('lib/assets/images/birth-star.svg');

  /// File path: lib/assets/images/booking-icon.png
  AssetGenImage get bookingIcon =>
      const AssetGenImage('lib/assets/images/booking-icon.png');

  /// File path: lib/assets/images/circle-arrow-right-white.svg
  SvgGenImage get circleArrowRightWhite =>
      const SvgGenImage('lib/assets/images/circle-arrow-right-white.svg');

  /// File path: lib/assets/images/circle-arrow-right.svg
  SvgGenImage get circleArrowRight =>
      const SvgGenImage('lib/assets/images/circle-arrow-right.svg');

  /// File path: lib/assets/images/events.svg
  SvgGenImage get events => const SvgGenImage('lib/assets/images/events.svg');

  /// File path: lib/assets/images/filter.svg
  SvgGenImage get filter => const SvgGenImage('lib/assets/images/filter.svg');

  /// File path: lib/assets/images/full-name.svg
  SvgGenImage get fullName =>
      const SvgGenImage('lib/assets/images/full-name.svg');

  /// File path: lib/assets/images/home-bottom.png
  AssetGenImage get homeBottom =>
      const AssetGenImage('lib/assets/images/home-bottom.png');

  /// File path: lib/assets/images/home-logo.svg
  SvgGenImage get homeLogo =>
      const SvgGenImage('lib/assets/images/home-logo.svg');

  /// File path: lib/assets/images/home-profile-tag.svg
  SvgGenImage get homeProfileTag =>
      const SvgGenImage('lib/assets/images/home-profile-tag.svg');

  /// File path: lib/assets/images/home-tab.svg
  SvgGenImage get homeTab =>
      const SvgGenImage('lib/assets/images/home-tab.svg');

  /// File path: lib/assets/images/how-it-works.png
  AssetGenImage get howItWorks =>
      const AssetGenImage('lib/assets/images/how-it-works.png');

  /// File path: lib/assets/images/location_icon.svg
  SvgGenImage get locationIcon =>
      const SvgGenImage('lib/assets/images/location_icon.svg');

  /// File path: lib/assets/images/notifications-with-badge.svg
  SvgGenImage get notificationsWithBadge =>
      const SvgGenImage('lib/assets/images/notifications-with-badge.svg');

  /// File path: lib/assets/images/notifications.svg
  SvgGenImage get notifications =>
      const SvgGenImage('lib/assets/images/notifications.svg');

  /// File path: lib/assets/images/pandits.svg
  SvgGenImage get pandits => const SvgGenImage('lib/assets/images/pandits.svg');

  /// File path: lib/assets/images/poojas.svg
  SvgGenImage get poojas => const SvgGenImage('lib/assets/images/poojas.svg');

  /// File path: lib/assets/images/profile-tab.svg
  SvgGenImage get profileTab =>
      const SvgGenImage('lib/assets/images/profile-tab.svg');

  /// File path: lib/assets/images/search.svg
  SvgGenImage get search => const SvgGenImage('lib/assets/images/search.svg');

  /// File path: lib/assets/images/temples.svg
  SvgGenImage get temples => const SvgGenImage('lib/assets/images/temples.svg');

  /// List of all assets
  List<dynamic> get values => [
    appleDefault,
    googleDefault,
    activityTab,
    arrowRight,
    backRounded,
    birthDay,
    birthStar,
    bookingIcon,
    circleArrowRightWhite,
    circleArrowRight,
    events,
    filter,
    fullName,
    homeBottom,
    homeLogo,
    homeProfileTag,
    homeTab,
    howItWorks,
    locationIcon,
    notificationsWithBadge,
    notifications,
    pandits,
    poojas,
    profileTab,
    search,
    temples,
  ];
}

abstract final class Assets {
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
