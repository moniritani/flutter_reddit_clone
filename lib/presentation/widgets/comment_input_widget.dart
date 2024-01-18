import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CommentInputSection extends StatelessWidget {
  final Function(String) onReply;
  final TextEditingController textEditingController;

  const CommentInputSection({super.key,
    required this.textEditingController, required this.onReply,});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXSmall, vertical: Dimens.spacingXSmall),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingSmall),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.cornerRadiusTiny),
                color: context.surfaceVariantColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXSmall, vertical: Dimens.spacingXSmall),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.cornerRadiusTiny),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isKeyboardVisible,
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: context.labelMediumStyle,
                                children: <TextSpan>[
                                  const TextSpan(text: "Please follow ",),
                                  TextSpan(
                                    text: "community rules",
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,  // Highlight color
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      // Handle the click action, such as navigating to a web page or another screen
                                    },
                                  ),
                                  const TextSpan(text: " when commenting",),
                                ],
                              ),
                            ),
                            const Gap(Dimens.spacingSmall)
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              key: const ValueKey("Comment TextField"),
                              controller: textEditingController,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Add a comment...',
                              ),
                            ),
                          ),
                          if (!isKeyboardVisible)
                            ImageButton(
                              icon: IconAssets.gallery(),
                              onPressed: () {
                                // TODO: to add action later
                              },
                            ),
                        ],
                      ),

                      Visibility(
                          visible: isKeyboardVisible,
                          child: Row(
                            children: [
                              ImageButton(
                                icon: IconAssets.attachment(),
                                onPressed: () {
                                  // TODO: to add action later
                                },
                              ),
                              const Gap(Dimens.spacingSmall),
                              ImageButton(
                                icon: IconAssets.gallery(),
                                onPressed: () {
                                  // TODO: to add action later
                                },
                              ),
                              const Spacer(),
                              ValueListenableBuilder<TextEditingValue>(
                                valueListenable: textEditingController,
                                builder: (context, value, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingSmall, vertical: Dimens.spacingXSmall), // Adjust the padding values as needed
                                    ),
                                    onPressed: value.text.isNotEmpty ? () {
                                      FocusScope.of(context).unfocus();
                                      onReply(textEditingController.text);
                                      textEditingController.clear();
                                    } : null,
                                    child: const Text("Reply"),
                                  );
                                },
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        );

  }
}