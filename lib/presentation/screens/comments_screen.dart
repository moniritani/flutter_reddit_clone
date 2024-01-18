import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/providers/providers.dart';
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/data/utils/mock_data_util.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class CommentsScreen extends ConsumerWidget {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Comment> comments = ref.watch(postProvider).comments;

    return Column(
      children: [
        _buildDraggableIndicator(context),
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: comments.length,
            itemBuilder: (context, index,animation) {
              return _buildAnimatedItem(ref,comments[index], animation);
            },
          ),
        ),
        _buildAddCommentSection(comments,ref),
      ],
    );
  }

  Widget _buildAnimatedItem(WidgetRef ref,Comment comment, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: CommentWidget(comment: comment,
        onMoreActionsClicked: (comment) {
        _showCommentActionSheet(ref.context,comment,ref);
      },),
    );
  }

  void _showCommentActionSheet(BuildContext context, Comment comment, WidgetRef ref) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext innerContext) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              BottomSheetActionWidget(icon: Icons.share,title: "Share",onTap: (){
                // TODO: Add functionality for this action
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.bookmark_border,title: "Save",onTap: (){
                // TODO: Add functionality for this
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.notifications_off,title: "Stop Reply Notifications",onTap: (){
                // TODO: Add functionality for this
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.copy,title: "Copy Text",onTap: (){
                // TODO: Add functionality for this
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.unfold_less,title: "Collapse Thread",onTap: (){
                // TODO: Add functionality for this
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.edit,title: "Edit",onTap: (){
                // TODO: Add functionality for this
                Navigator.pop(innerContext);
              }),
              BottomSheetActionWidget(icon: Icons.delete,title: "Delete",onTap: (){
                Navigator.pop(innerContext);
                _showDeletionConfirmationDialog(context, ref, comment);
              }),

              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.spacingSmall),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: Dimens.elevationLower,
                        backgroundColor: context.surfaceVariantColor,
                        foregroundColor: context.onSurfaceVariantColor,
                      ),
                    onPressed: () {
                      Navigator.pop(innerContext);
                    }, child: const Text("Close"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeletionConfirmationDialog(BuildContext context, WidgetRef ref, Comment commentToDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(title: "Are you sure?",
            content: "You cannot restore comments that have been deleted",
            confirmButtonText: "DELETE",
            cancelButtonText: "CANCEL",
            onConfirm: (){
              List<Comment> comments = ref.watch(postProvider).comments;
              ref.read(postProvider.notifier).deleteComment(commentToDelete.id);
              _listKey.currentState?.removeItem(
                comments.indexOf(commentToDelete), (context, animation) => _buildAnimatedItem(ref,commentToDelete, animation),
                duration: AppDurations.defaultAnimation,
              );
              Navigator.of(context).pop();
            },
            onCancel: (){
              Navigator.of(context).pop();
            });
      },
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

  Widget _buildAddCommentSection(List<Comment> comments, WidgetRef ref) {
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
                  // Create a new comment
                  Comment newComment = Comment(
                    id: DateTime.now().toString(), // Generate a unique ID
                    text: "Hello",
                    date: DateTime.now(),
                    user: MockDataUtil.getMockUser(),
                    votes: VoteModel(),
                    replies: [],
                  );

                  ref.read(postProvider.notifier).addComment(newComment);
                  _listKey.currentState?.insertItem(comments.length - 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}