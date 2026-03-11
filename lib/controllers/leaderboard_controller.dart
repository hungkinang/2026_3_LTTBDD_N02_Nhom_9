import '../data/fake_db.dart';
import '../models/leaderboard_model.dart';

class LeaderboardController {
  List<LeaderboardEntry> getLeaderboard() {
    final list = List<LeaderboardEntry>.from(FakeDB.leaderboard);
    list.sort((a, b) => b.score.compareTo(a.score));
    for (int i = 0; i < list.length; i++) {
      list[i].rank = i + 1;
    }
    return list;
  }

  List<LeaderboardEntry> getTop3() {
    final all = getLeaderboard();
    return all.take(3).toList();
  }

  List<LeaderboardEntry> getRest() {
    final all = getLeaderboard();
    return all.skip(3).toList();
  }
}
