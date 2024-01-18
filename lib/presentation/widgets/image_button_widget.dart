import 'package:reddit_clone/app/app_dependencies.dart';

class ImageButton extends StatelessWidget {
  final String? label;
  final CustomIcon icon;
  final double verticalPadding;
  final double horizontalPadding;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const ImageButton({
    Key? key,
    required this.icon,
    this.label,
    this.verticalPadding = Dimens.spacingSmall,
    this.horizontalPadding = 0,
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ,horizontal: horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child:icon,
          ),
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(top: Dimens.spacingNano),
              child: Text(
                label!,
                style: textStyle ?? context.bodyMediumStyle,
              ),
            ),
        ],
      ),
    );
  }
}
