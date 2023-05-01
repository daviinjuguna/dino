/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/background.mp3
  String get background => 'assets/audio/background.mp3';

  /// File path: assets/audio/effect.mp3
  String get effect => 'assets/audio/effect.mp3';

  /// List of all assets
  List<String> get values => [background, effect];
}

class $AssetsEnemiesGen {
  const $AssetsEnemiesGen();

  $AssetsEnemiesBatGen get bat => const $AssetsEnemiesBatGen();
  $AssetsEnemiesBirdGen get bird => const $AssetsEnemiesBirdGen();
  $AssetsEnemiesGhostGen get ghost => const $AssetsEnemiesGhostGen();
  $AssetsEnemiesPigGen get pig => const $AssetsEnemiesPigGen();
  $AssetsEnemiesRinoGen get rino => const $AssetsEnemiesRinoGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dino_gif_mort.gif
  AssetGenImage get dinoGifMort =>
      const AssetGenImage('assets/images/dino_gif_mort.gif');

  /// File path: assets/images/dino_gif_tard.gif
  AssetGenImage get dinoGifTard =>
      const AssetGenImage('assets/images/dino_gif_tard.gif');

  /// File path: assets/images/dino_gif_vita.gif
  AssetGenImage get dinoGifVita =>
      const AssetGenImage('assets/images/dino_gif_vita.gif');

  /// File path: assets/images/dino_gif_voux.gif
  AssetGenImage get dinoGifVoux =>
      const AssetGenImage('assets/images/dino_gif_voux.gif');

  /// File path: assets/images/dino_sprite_mort.png
  AssetGenImage get dinoSpriteMort =>
      const AssetGenImage('assets/images/dino_sprite_mort.png');

  /// File path: assets/images/dino_sprite_tard.png
  AssetGenImage get dinoSpriteTard =>
      const AssetGenImage('assets/images/dino_sprite_tard.png');

  /// File path: assets/images/dino_sprite_vita.png
  AssetGenImage get dinoSpriteVita =>
      const AssetGenImage('assets/images/dino_sprite_vita.png');

  /// File path: assets/images/dino_sprite_voux.png
  AssetGenImage get dinoSpriteVoux =>
      const AssetGenImage('assets/images/dino_sprite_voux.png');

  $AssetsImagesParallaxGen get parallax => const $AssetsImagesParallaxGen();

  /// List of all assets
  List<AssetGenImage> get values => [
        dinoGifMort,
        dinoGifTard,
        dinoGifVita,
        dinoGifVoux,
        dinoSpriteMort,
        dinoSpriteTard,
        dinoSpriteVita,
        dinoSpriteVoux
      ];
}

class $AssetsEnemiesBatGen {
  const $AssetsEnemiesBatGen();

  /// File path: assets/enemies/bat/flying.png
  AssetGenImage get flying =>
      const AssetGenImage('assets/enemies/bat/flying.png');

  /// List of all assets
  List<AssetGenImage> get values => [flying];
}

class $AssetsEnemiesBirdGen {
  const $AssetsEnemiesBirdGen();

  /// File path: assets/enemies/bird/fly.png
  AssetGenImage get fly => const AssetGenImage('assets/enemies/bird/fly.png');

  /// List of all assets
  List<AssetGenImage> get values => [fly];
}

class $AssetsEnemiesGhostGen {
  const $AssetsEnemiesGhostGen();

  /// File path: assets/enemies/ghost/idle.png
  AssetGenImage get idle =>
      const AssetGenImage('assets/enemies/ghost/idle.png');

  /// List of all assets
  List<AssetGenImage> get values => [idle];
}

class $AssetsEnemiesPigGen {
  const $AssetsEnemiesPigGen();

  /// File path: assets/enemies/pig/walk.png
  AssetGenImage get walk => const AssetGenImage('assets/enemies/pig/walk.png');

  /// List of all assets
  List<AssetGenImage> get values => [walk];
}

class $AssetsEnemiesRinoGen {
  const $AssetsEnemiesRinoGen();

  /// File path: assets/enemies/rino/run.png
  AssetGenImage get run => const AssetGenImage('assets/enemies/rino/run.png');

  /// List of all assets
  List<AssetGenImage> get values => [run];
}

class $AssetsImagesParallaxGen {
  const $AssetsImagesParallaxGen();

  /// File path: assets/images/parallax/plx-1.png
  AssetGenImage get plx1 =>
      const AssetGenImage('assets/images/parallax/plx-1.png');

  /// File path: assets/images/parallax/plx-2.png
  AssetGenImage get plx2 =>
      const AssetGenImage('assets/images/parallax/plx-2.png');

  /// File path: assets/images/parallax/plx-3.png
  AssetGenImage get plx3 =>
      const AssetGenImage('assets/images/parallax/plx-3.png');

  /// File path: assets/images/parallax/plx-4.png
  AssetGenImage get plx4 =>
      const AssetGenImage('assets/images/parallax/plx-4.png');

  /// File path: assets/images/parallax/plx-5.png
  AssetGenImage get plx5 =>
      const AssetGenImage('assets/images/parallax/plx-5.png');

  /// File path: assets/images/parallax/plx-6.png
  AssetGenImage get plx6 =>
      const AssetGenImage('assets/images/parallax/plx-6.png');

  /// List of all assets
  List<AssetGenImage> get values => [plx1, plx2, plx3, plx4, plx5, plx6];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsEnemiesGen enemies = $AssetsEnemiesGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
