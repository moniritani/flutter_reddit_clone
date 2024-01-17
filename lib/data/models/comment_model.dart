import 'package:reddit_clone/data/models/models.dart';

class Comment {
  final String id;
  final String text;
  final DateTime date;
  final User user;
  final VoteModel? votes;
  final List<Comment> replies;

  Comment({
    required this.id,
    required this.text,
    required this.date,
    required this.user,
    required this.votes,
    this.replies = const [],
  });
}