import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/providers/post_provider.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class ActionButtons extends ConsumerWidget {

  final VoidCallback onSharePressed;
  final VoidCallback onCommentPressed;

  const ActionButtons({super.key,
    required this.onSharePressed,
    required this.onCommentPressed,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final post = ref.watch(postProvider);
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
