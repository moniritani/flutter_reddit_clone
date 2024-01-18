class User {
  final String username;
  final String? tag;
  final String avatarUrl;

  User({required this.username,
    required this.avatarUrl,
    this.tag
  });
}
