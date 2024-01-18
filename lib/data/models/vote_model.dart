import 'package:reddit_clone/app/app_dependencies.dart';

enum VoteStatus { upVoted, downVoted, none }

class VoteModel {
  int totalVotes;
  VoteStatus userVoteStatus;

  VoteModel({this.totalVotes = 0, this.userVoteStatus = VoteStatus.none});

  factory VoteModel.fresh() => VoteModel();


  void upVote() {
    if (userVoteStatus != VoteStatus.upVoted) {
      totalVotes += userVoteStatus == VoteStatus.none ? 1 : 2;
      userVoteStatus = VoteStatus.upVoted;
    } else {
      totalVotes--;
      userVoteStatus = VoteStatus.none;
    }
  }

  void downVote() {
    if (userVoteStatus != VoteStatus.downVoted) {
      totalVotes -= userVoteStatus == VoteStatus.none ? 1 : 2;
      userVoteStatus = VoteStatus.downVoted;
    } else {
      totalVotes++;
      userVoteStatus = VoteStatus.none;
    }
  }

  void clearVote() {
    if (userVoteStatus == VoteStatus.downVoted) {
      totalVotes += 1;
    }
    if (userVoteStatus == VoteStatus.upVoted) {
      totalVotes -= 1;
    }
    userVoteStatus = VoteStatus.none;
  }


  bool get isDownVoted => userVoteStatus == VoteStatus.downVoted;
  bool get isUpVoted => userVoteStatus == VoteStatus.upVoted;

}

extension VoteStatusUI on VoteStatus {

  Color getColor({Color? defaultColor}){
    switch (this) {
      case VoteStatus.upVoted:
        return Colors.green;
      case VoteStatus.downVoted:
        return Colors.red;
      default:
        return defaultColor ?? Colors.grey;
    }
  }

}
