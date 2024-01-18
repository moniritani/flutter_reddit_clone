import 'package:video_player/video_player.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/providers/providers.dart';
import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';
import 'package:reddit_clone/presentation/screens/screens.dart';


class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> with TickerProviderStateMixin {
  bool _isControlsVisible = true;
  late double _videoPlayerHeight;
  Alignment _videoAlignment = Alignment.center;
  late AnimationController _bottomSheetAnimationController;

  @override
  void initState() {
    super.initState();
    _bottomSheetAnimationController = AnimationController(vsync: this, duration: AppDurations.defaultAnimation,);
  }

  @override
  void dispose() {
    _bottomSheetAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _videoPlayerHeight = context.screenHeight - context.statusBarHeight;
  }


  double _calculateBottomSheetHeight(VideoPlayerController controller) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - context.statusBarHeight;
    final videoHeight = screenWidth / controller.value.aspectRatio;
    return screenHeight - videoHeight;
  }

  void _openCommentsBottomSheet(Post post, VideoPlayerController controller) {
    final bottomSheetHeight = _calculateBottomSheetHeight(controller);

    setState(() {
      _toggleControlsVisibility(isVisible: false);
      _videoAlignment = Alignment.topCenter;
      _videoPlayerHeight = MediaQuery.of(context).size.width / controller.value.aspectRatio;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      transitionAnimationController: _bottomSheetAnimationController,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) ,
            height: bottomSheetHeight,
            child: CommentsScreen(),
          ),
        );
      },
    ).then((_) {
      setState(() {
        _toggleControlsVisibility(isVisible: true);
        _videoAlignment = Alignment.center;
        _videoPlayerHeight = MediaQuery.of(context).size.width / controller.value.aspectRatio;
      });
      _bottomSheetAnimationController.reset();
    });
    _bottomSheetAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final post = ref.watch(postProvider);
    final videoControllerNotifier = ref.read(videoPlayerControllerProvider.notifier);
    final videoController = ref.watch(videoPlayerControllerProvider);

    if (videoController == null) {
      videoControllerNotifier.initialize(post.videoUrl);
    }

    return Theme(
      data: AppTheme.dark(),
      child: Scaffold(
        body: _buildVideoPlayer(videoController, post),
      ),
    );
  }

  void _toggleControlsVisibility({bool? isVisible}) {
    setState(() {
      _isControlsVisible = isVisible ?? !_isControlsVisible;
    });
  }

  Widget _buildAppBar(Post post){
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Opacity(
        opacity: _isControlsVisible ? 1.0 : 0.0,
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: AppColors.onSurfaceDark),
          title: UserHeaderWidget(user: post.user,avatarSize: 10.0,),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz,color: AppColors.onSurfaceDark,),
              onPressed: () {
                // Handle options button press
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(VideoPlayerController? controller, Post post) {
    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return GestureDetector(
      onTap: (){
        _toggleControlsVisibility();
      },
      child: Stack(
        alignment: _videoAlignment,
        children: <Widget>[
          _buildAppBar(post),
          _buildAnimatedVideoPlayer(controller),
          _buildVideoControls(post, controller),
        ],
      ),
    );
  }

  Widget _buildAnimatedVideoPlayer(VideoPlayerController controller) {

    return Padding(
      padding: EdgeInsets.only(top: context.statusBarHeight),
      child: AnimatedAlign(
        alignment: _videoAlignment,
        duration: _bottomSheetAnimationController.duration!,
        child: AnimatedContainer(
          duration: _bottomSheetAnimationController.duration!,
          constraints: BoxConstraints(
            maxHeight: _videoPlayerHeight,
          ),
          height: _videoPlayerHeight,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoControls(Post post, VideoPlayerController controller) {
    return Opacity(
      opacity: _isControlsVisible ? 1.0 : 0.0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: VideoControlsWidget(post: post, controller: controller,
          onSharePressed: () {
          // TODO: add action here for sharing
          },
          onCommentPressed: () {
          _openCommentsBottomSheet(post,controller);
          }
        ),
      ),
    );
  }

}