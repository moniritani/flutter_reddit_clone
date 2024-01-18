import 'package:reddit_clone/data/models/models.dart';

class Post {
  final String id;
  final User user;
  final String description;
  final String videoUrl;
  final VoteModel? votes;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.user,
    required this.description,
    required this.videoUrl,
    this.votes,
    this.comments = const [],
  });

  Post copyWith({
    String? id,
    User? user,
    String? description,
    String? videoUrl,
    VoteModel? votes,
    List<Comment>? comments,
  }) {
    return Post(
      id: id ?? this.id,
      user: user ?? this.user,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      votes: votes ?? this.votes,
      comments: comments ?? this.comments,
    );
  }
}