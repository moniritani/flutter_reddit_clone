import 'package:reddit_clone/app/app_dependencies.dart';

class IconAssets {

  static Image _customIcons(
      String assetPath,
      {
    double? width,
    double? height,
    Color? color,
  }) {
    return Image.asset(
      assetPath,
      width: width ?? 24.0,
      height: height ?? 24.0,
      color: color ?? AppColors.textDark,
    );
  }

  static Image play({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_play.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image mute({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_mute.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image pause({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_pause.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image share({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_share.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image comment({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_comment.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image arrowUp({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_up.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image arrowUpFilled({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_up_filled.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image volumeUp({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_volume_up.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image arrowDown({
    double? width,
    double? height,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_down.png',
      width: width,
      height: height,
      color: color,
    );
  }

  static Image arrowDownFilled({
    double width = 24.0,
    double height = 24.0,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_down_filled.png',
      width: width,
      height: height,
      color: color,
    );
  }

}