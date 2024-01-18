import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class ActionButtons extends StatelessWidget {

  final Post post;

  const ActionButtons({super.key,required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        VotingWidget(vote: post.votes!, direction: Axis.vertical),
        ImageButton(
          label: "${post.comments.length}",
          icon: IconAssets.comment(),
          onPressed: () {

          },
        ),
        ImageButton(
          icon: IconAssets.share(),
          onPressed: () {

          },
        ),

      ],
    );
  }
}
