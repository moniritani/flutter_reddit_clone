
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';

class UserHeaderWidget extends StatelessWidget {
  final User user;
  final double avatarSize;

  const UserHeaderWidget({super.key,
    required this.user,
    this.avatarSize = 15.0
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: avatarSize,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        const Gap(Dimens.spacingXSmall),
        Text(
          user.username,
          style: context.labelLargeStyle,
        ),
      ],
    );
  }
}
