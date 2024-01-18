import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/data/utils/mock_data_util.dart';

final postProvider = StateNotifierProvider<PostNotifier, Post>((ref) => PostNotifier());

class PostNotifier extends StateNotifier<Post> {
  PostNotifier() : super(MockDataUtil.getMockPost());

  void updatePost(Post updatedPost) {
    state = updatedPost;
  }

  void addComment(Comment comment) {
    final updatedComments = [...state.comments, comment];
    state = state.copyWith(comments: updatedComments);
  }

  void deleteComment(String commentId) {
    final updatedComments = state.comments.where((comment) => comment.id != commentId).toList();
    state = state.copyWith(comments: updatedComments);
  }
}