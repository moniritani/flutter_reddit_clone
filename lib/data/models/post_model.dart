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
}