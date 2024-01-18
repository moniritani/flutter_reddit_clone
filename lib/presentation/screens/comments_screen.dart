import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class CommentsScreen extends StatelessWidget {
  final Post post;

  const CommentsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDraggableIndicator(context),
        Expanded(
          child: ListView.builder(
            itemCount: post.comments.length,
            itemBuilder: (context, index) {
              return CommentWidget(comment: post.comments[index]);
            },
          ),
        ),
        _buildAddCommentSection(),
      ],
    );
  }

  Widget _buildDraggableIndicator(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Container(
          width: 40,
          height: Dimens.strokeThick,
          decoration: BoxDecoration(
            color: context.dividerColor,
            borderRadius: BorderRadius.circular(Dimens.cornerRadiusSmall),
          ),
        ),
      ),
    );
  }

  Widget _buildAddCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXSmall, vertical: Dimens.spacingXSmall),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.cornerRadiusTiny),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Add a comment...',
                ),
              ),
            ),
            ImageButton(
              icon: IconAssets.gallery(),
              onPressed: () {
                // TODO: Implement attachment logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
