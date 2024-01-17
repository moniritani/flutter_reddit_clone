import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class VideoPlayerControllerNotifier extends StateNotifier<VideoPlayerController?> {
  VideoPlayerControllerNotifier() : super(null);

  Future<void> initialize(String videoUrl) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await controller.initialize();
    state = controller;
    state?.play();
  }


  @override
  void dispose() {
    debugPrint("Disposing from controller Notifier");
    state?.dispose();
    super.dispose();
  }
}

final videoPlayerControllerProvider = StateNotifierProvider.autoDispose<VideoPlayerControllerNotifier, VideoPlayerController?>(
      (ref) => VideoPlayerControllerNotifier(),
);