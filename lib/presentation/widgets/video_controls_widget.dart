import 'package:reddit_clone/app/app_dependencies.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/presentation/widgets/widgets.dart';
import 'package:video_player/video_player.dart';


class VideoControlsWidget extends StatefulWidget {
  final Post post;
  final VoidCallback onSharePressed;
  final VoidCallback onCommentPressed;
  final VideoPlayerController controller;

  const VideoControlsWidget({Key? key,
    required this.post,
    required this.controller,
    required this.onSharePressed,
    required this.onCommentPressed,}) : super(key: key);

  @override
  State<VideoControlsWidget> createState()  => _VideoControlsWidgetState();
}

class _VideoControlsWidgetState extends State<VideoControlsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacingSmall),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // User Info + Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //User Info
                  UserHeaderWidget(user: widget.post.user),
                  const Gap(Dimens.spacingSmall),
                  //Post Description
                  SizedBox(
                    width: context.screenWidth * 0.7,
                    child: Text(
                      maxLines: 3,
                      widget.post.description,
                      style: context.labelLargeStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(Dimens.spacingSmall),
                ],
              ),
              const Spacer(),
              ActionButtons(post: widget.post,
                  onSharePressed: widget.onSharePressed,
                  onCommentPressed: widget.onCommentPressed,
              )
            ],
          ),
          // Video Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _playPauseButton(),
              _videoProgressIndicator(),
              _buildPositionIndicator(),
              _muteButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _playPauseButton() {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, VideoPlayerValue value, child) {
        return ImageButton(
          icon: value.isPlaying ? IconAssets.pause() : IconAssets.play(),
          onPressed: () {
            if (value.isPlaying) {
              widget.controller.pause();
            } else {
              widget.controller.play();
            }
          },
        );
      },
    );
  }


  Widget _videoProgressIndicator() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingSmall),
        child: VideoProgressIndicator(
          widget.controller,
          allowScrubbing: true,
          padding: EdgeInsets.zero,
          colors: VideoProgressColors(
            playedColor: AppColors.onSurfaceDark,
            bufferedColor: Colors.transparent,
            backgroundColor: AppColors.onSurfaceDark.withOpacity(0.3)
          ),
        ),
      ),
    );
  }

  Widget _muteButton() {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, VideoPlayerValue value, child) {
        return ImageButton(
          icon: widget.controller.value.volume > 0 ? IconAssets.volumeUp() : IconAssets.mute(),
          onPressed: () {
            widget.controller.setVolume(widget.controller.value.volume > 0 ? 0 : 1);
          },
        );
      },
    );
  }

  Widget _buildPositionIndicator() {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, VideoPlayerValue value, child) {
        final remaining = value.duration - value.position;
        return Padding(
          padding: const EdgeInsets.only(right: Dimens.spacingSmall),
          child: Text(_formatDuration(remaining)),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

}


