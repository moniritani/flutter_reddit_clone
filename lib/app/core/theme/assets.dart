import 'package:reddit_clone/app/app_dependencies.dart';

class IconAssets {

  static CustomIcon _customIcons(String assetPath, {
    Size? size,
    Color? color})
  {
    return CustomIcon(
      assetPath: assetPath,
      size: size,
      color: color,
    );
  }

  static CustomIcon play({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_play.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon mute({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_mute.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon pause({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_pause.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon share({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_share.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon comment({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_comment.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon arrowUp({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_up.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon arrowUpFilled({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_up_filled.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon volumeUp({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_volume_up.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon arrowDown({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_down.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon arrowDownFilled({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_arrow_down_filled.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon reply({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_reply.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon moreHorizontal({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_ellipsis.png',
      size: size,
      color: color,
    );
  }

  static CustomIcon gallery({
    Size? size,
    Color? color,
  }) {
    return _customIcons(
      'assets/icons/ic_gallery.png',
      size: size,
      color: color,
    );
  }

}

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final Size? size;
  final Color? color;

  const CustomIcon({super.key,
    required this.assetPath,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? context.onSurfaceColor;

    return Image.asset(
      assetPath,
      width: size?.width ?? Dimens.iconSizeDefault,
      height: size?.height ?? Dimens.iconSizeDefault,
      color: defaultColor,
    );
  }
}