
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';

class UserHeaderWidget extends StatelessWidget {
  final User user;
  final double avatarSize;
  final MainAxisAlignment alignment;
  final bool showTag;
  final String? timestamp;

  const UserHeaderWidget({
    Key? key,
    required this.user,
    this.avatarSize = 15.0,
    this.alignment = MainAxisAlignment.center,
    this.timestamp,
    this.showTag = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: alignment,
          children: [
            CircleAvatar(
              radius: avatarSize,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            const Gap(Dimens.spacingXSmall),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.username,
                      style: context.labelLargeStyle,
                    ),
                    if (timestamp != null) ...[
                      const Gap(Dimens.spacingTiny),
                      const Text("\u00B7", style: TextStyle(fontWeight: FontWeight.bold)),
                      const Gap(Dimens.spacingTiny),
                      Text(timestamp!, style: context.labelSmallStyle),
                    ],
                  ],
                ),
                if (showTag && user.tag != null) ...[
                  Text(user.tag!, style: context.labelSmallStyle),
                ],
              ],
            ),

          ],
        ),

      ],
    );
  }
}
