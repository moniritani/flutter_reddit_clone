import 'package:reddit_clone/app/app_dependencies.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.surfaceColor,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: Dimens.spacingSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.cornerRadiusSmall)),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingNormal),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: context.titleLargeStyle,
            ),
            const Gap(Dimens.spacingLarge),
            Text(
              content,
              style: context.bodyLargeStyle,
            ),
            const Gap(Dimens.spacingSmall),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.surfaceVariantColor,
                      foregroundColor: context.onSurfaceVariantColor,
                      elevation: Dimens.elevationLower,
                    ),
                    child: Text(cancelButtonText,style: context.bodyMediumStyle!.copyWith(color: context.onSurfaceVariantColor)),
                  ),
                ),
                const Gap(Dimens.spacingXSmall),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      elevation: Dimens.elevationLower,
                      backgroundColor: context.errorColor,
                      foregroundColor: context.onErrorColor,
                    ),
                    child: Text(confirmButtonText,style: context.bodyMediumStyle!.copyWith(color: context.onErrorColor)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
