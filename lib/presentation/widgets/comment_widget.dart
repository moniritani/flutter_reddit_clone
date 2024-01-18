
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  final double depthPadding;

  const CommentWidget({
    Key? key,
    required this.comment,
    this.depthPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: depthPadding,top: depthPadding == 0 ? Dimens.spacingSmall : 0),
      child: Container(
        color: context.surfaceColor,
        child: IntrinsicHeight(
          child: Row(
            children: [
              if(depthPadding > 0)
                VerticalDivider(
                  color: context.dividerColor,
                  thickness: Dimens.strokeThinnest,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCommentContent(comment),
                    ...comment.replies.map((reply) => CommentWidget(
                      comment: reply,
                      depthPadding: depthPadding + Dimens.spacingSmall,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentContent(Comment comment) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.spacingNormal,right: Dimens.spacingMicro),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserHeaderWidget(user: comment.user,alignment: MainAxisAlignment.start,timestamp: comment.date.timeTag,showTag: true,),
          const Gap(Dimens.spacingXSmall),
          Text(comment.text,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Gap(Dimens.spacingNormal),
              ImageButton(
                icon: IconAssets.moreHorizontal(size: const Size.square(Dimens.iconSizeSmall)),
                onPressed: (){
                  //TODO: add action here
                },
              ),
              const Gap(Dimens.spacingNormal),
              ImageButton(
                icon: IconAssets.reply(size: const Size.square(Dimens.iconSizeSmall)),
                onPressed: (){
                  //TODO: add action here
                },
              ),
              const Gap(Dimens.spacingNormal),
              VotingWidget(vote: comment.votes!, direction: Axis.horizontal,iconSize: const Size.square(Dimens.iconSizeSmall)),
              const Gap(Dimens.spacingNormal),
            ],
          )
          // ... other comment details ...
        ],
      ),
    );
  }
}
