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



  bool get isDownVoted => userVoteStatus == VoteStatus.downVoted;
  bool get isUpVoted => userVoteStatus == VoteStatus.upVoted;

}