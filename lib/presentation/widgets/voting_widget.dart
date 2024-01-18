import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';

class VotingWidget extends StatefulWidget {
  final Axis direction;
  final VoteModel vote;
  final Size iconSize;
  final double spacing;

  const VotingWidget({Key? key,
    required this.vote,
    this.spacing = Dimens.spacingTiny,
    this.iconSize = const Size.square(Dimens.iconSizeDefault),
    this.direction = Axis.vertical}) : super(key: key);

  @override
  State<VotingWidget> createState() => _VotingWidgetState();

}

class _VotingWidgetState extends State<VotingWidget> with TickerProviderStateMixin {
  late Animation<Offset> _upvoteAnimation;
  late Animation<Offset> _downVoteAnimation;
  late AnimationController _upVoteController;
  late AnimationController _downVoteController;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _upVoteController   = AnimationController(duration: AppDurations.shortAnimation, vsync: this);
    _upvoteAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.25),
    ).animate(CurvedAnimation(
      parent: _upVoteController,
      curve: Curves.easeInOut,
    ));

    _downVoteController = AnimationController(duration: AppDurations.shortAnimation, vsync: this);
    _downVoteAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.25),
    ).animate(CurvedAnimation(
      parent: _downVoteController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _upVoteController.dispose();
    _downVoteController.dispose();
    super.dispose();
  }

  void _handleUpvote() {
    if (!widget.vote.isUpVoted){
      setState(() {
        widget.vote.upVote();
      });
      _upVoteController.forward().then((_) => _upVoteController.reverse());
    }
    else{
      _clearVote();
    }
  }

  void _handleDownVote() {
    if (!widget.vote.isDownVoted){
      setState(() {
        widget.vote.downVote();
      });
      _downVoteController.forward().then((_) => _downVoteController.reverse());
    }
    else{
      _clearVote();
    }
  }

  void _clearVote(){
    setState(() {
      widget.vote.clearVote();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SlideTransition(
          position: _upvoteAnimation,
          child: ImageButton(
            verticalPadding: 0,
            horizontalPadding: 0,
            onPressed: _handleUpvote,
            icon: widget.vote.isUpVoted ? IconAssets.arrowUpFilled(color: Colors.green,size: widget.iconSize) : IconAssets.arrowUp(size: widget.iconSize),
          ),
        ),
        Gap(widget.spacing),
        Text('${widget.vote.totalVotes}'),
        Gap(widget.spacing),
        SlideTransition(
          position: _downVoteAnimation,
          child: ImageButton(
            verticalPadding: 0,
            horizontalPadding: 0,
            onPressed: _handleDownVote,
            icon: widget.vote.isDownVoted ? IconAssets.arrowDownFilled(color: Colors.red,size: widget.iconSize) : IconAssets.arrowDown(size: widget.iconSize),
          ),
        ),
      ],
    );
  }
}