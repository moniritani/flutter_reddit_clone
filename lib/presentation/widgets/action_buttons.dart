import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class ActionButtons extends StatelessWidget {

  final Post post;
  final VoidCallback onSharePressed;
  final VoidCallback onCommentPressed;

  const ActionButtons({super.key,
    required this.post,
    required this.onSharePressed,
    required this.onCommentPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.spacingSmall),
          child: VotingWidget(vote: post.votes!, direction: Axis.vertical),
        ),
        ImageButton(
          label: "${post.comments.length}",
          icon: IconAssets.comment(),
          onPressed: onCommentPressed,
        ),
        ImageButton(
          icon: IconAssets.share(),
          onPressed: onSharePressed,
        ),

      ],
    );
  }
}
