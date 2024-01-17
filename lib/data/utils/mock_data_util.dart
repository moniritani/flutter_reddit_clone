import 'dart:math';

import 'package:faker/faker.dart';
import 'package:reddit_clone/data/models/models.dart';

class MockDataUtil {
  static final Faker _faker = Faker();
  static final Random _random = Random();

  static final List<String> _avatarUrls = [
    "https://gravatar.com/avatar/109603027161bc48e742fccce37f0f47?s=400&d=robohash&r=x",
    "https://gravatar.com/avatar/90e3ba682d63fca00a369aac41a40740?s=400&d=robohash&r=x",
    "https://gravatar.com/avatar/3bb2894f3734ee103e62085ff0d535f1?s=400&d=robohash&r=x",
    "https://robohash.org/a18682de2d887cc23b3ae8d9c7fa751f?set=set4&bgset=&size=400x400",
    "https://robohash.org/f3efb65d0d0c10bb6080e5cb3c0a5bc1?set=set4&bgset=&size=400x400",
    "https://gravatar.com/avatar/f11d5e091b5d3eeef78181f0ecf41996?s=400&d=identicon&r=x",
    "https://gravatar.com/avatar/f11d5e091b5d3eeef78181f0ecf41996?s=400&d=retro&r=x",
  ];

  static final List<String> _videoUrls = [
    "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  ];



  static User getMockUser() {
    String avatarUrl = _avatarUrls[_random.nextInt(_avatarUrls.length)];
    return User(
      username: _faker.person.firstName(),
      avatarUrl: avatarUrl,
    );
  }

  static List<Comment> getMockComments() {
    int commentCount = Random().nextInt(10) + 1;
    User user = getMockUser();
    List<Comment> comments = [];

    for (int i = 1; i <= commentCount; i++) {
      Comment comment = Comment(
        id: "c$i",
        text: _faker.lorem.sentence(),
        date: DateTime.now().subtract(Duration(days: Random().nextInt(30))),
        user: user,
        votes: VoteModel(
            totalVotes: Random().nextInt(70),
            userVoteStatus: VoteStatus.none
        ),
        replies: [],
      );

      int replyCount = Random().nextInt(5); // Generate between 0 to 5 replies
      for (int j = 1; j <= replyCount; j++) {
        Comment reply = Comment(
          id: "r${i}_$j",
          text: _faker.lorem.sentence(),
          date: DateTime.now().subtract(Duration(minutes: Random().nextInt(60 * 24))),
          user: getMockUser(),
          votes: VoteModel(
              totalVotes: Random().nextInt(10),
              userVoteStatus: VoteStatus.none
          ),
          replies: [],
        );
        comment.replies.add(reply);
      }

      comments.add(comment);
    }

    return comments;
  }

  static Post getMockPost() {
    String videoUrl = _videoUrls[_random.nextInt(_videoUrls.length)];
    return Post(
      id: "p1",
      votes: VoteModel(
        totalVotes: Random().nextInt(1000),
        userVoteStatus: VoteStatus.none
      ),
      user: getMockUser(),
      comments: getMockComments(),
      description: _faker.lorem.sentence(),
      videoUrl: videoUrl,
    );
  }
}

/*

https://gravatar.com/avatar/109603027161bc48e742fccce37f0f47?s=400&d=robohash&r=x
https://gravatar.com/avatar/90e3ba682d63fca00a369aac41a40740?s=400&d=robohash&r=x
https://gravatar.com/avatar/3bb2894f3734ee103e62085ff0d535f1?s=400&d=robohash&r=x
https://robohash.org/a18682de2d887cc23b3ae8d9c7fa751f?set=set4&bgset=&size=400x400
https://robohash.org/f3efb65d0d0c10bb6080e5cb3c0a5bc1?set=set4&bgset=&size=400x400
https://gravatar.com/avatar/f11d5e091b5d3eeef78181f0ecf41996?s=400&d=identicon&r=x
https://gravatar.com/avatar/f11d5e091b5d3eeef78181f0ecf41996?s=400&d=retro&r=x

 */


/*
class MockDataUtil {
  static final Random _random = Random();

  static final List<String> _usernames = [
    "user_blue", "user_green", "user_red", "user_yellow", "user_purple",
  ];

  static final List<String> _comments = [
    "Really insightful post!", "Thanks for sharing this.", "Interesting perspective!",
    "I never thought about it that way.", "Great video content!",
    // Add more sample comments
  ];

  static User getMockUser() {
    String username = _usernames[_random.nextInt(_usernames.length)];
    String avatarUrl = "https://example.com/avatars/${_random.nextInt(100)}.jpg";
    return User(username: username, avatarUrl: avatarUrl);
  }

  static List<Comment> getMockComments(int count) {
    return List.generate(count, (_) {
      String text = _comments[_random.nextInt(_comments.length)];
      DateTime date = DateTime.now().subtract(Duration(days: _random.nextInt(10)));
      return Comment(
        id: "c${_random.nextInt(1000)}",
        text: text,
        date: date,
        user: getMockUser(),
        votes: _random.nextInt(100),
        replies: getMockReplies(_random.nextInt(5)),
      );
    });
  }

  static List<Comment> getMockReplies(int count) {
    return List.generate(count, (_) {
      String text = _comments[_random.nextInt(_comments.length)];
      DateTime date = DateTime.now().subtract(Duration(days: _random.nextInt(10) + 1));
      return Comment(
        id: "r${_random.nextInt(1000)}",
        text: text,
        date: date,
        user: getMockUser(),
        votes: _random.nextInt(50),
      );
    });
  }

  static Post getMockPost() {
    return Post(
      id: "p${_random.nextInt(1000)}",
      user: getMockUser(),
      description: "This is a randomly generated post",
      videoUrl: "https://www.example.com/videos/${_random.nextInt(50)}.mp4",
      votes: _random.nextInt(500),
      comments: getMockComments(10),
    );
  }
}*/
