import '../data/fake_db.dart';
import '../models/history_model.dart';

class HistoryController {
  List<HistoryModel> getHistories() {
    return FakeDB.histories.reversed.toList();
  }

  void addHistory(String title, int score, int total) {
    FakeDB.histories.add(
      HistoryModel(
        title: title,
        score: score,
        total: total,
        date: DateTime.now().toString().substring(0, 10),
      ),
    );
  }

  double getAverageScore() {
    if (FakeDB.histories.isEmpty) return 0;
    double sum = 0;
    for (var h in FakeDB.histories) {
      sum += h.score / h.total * 10;
    }
    return sum / FakeDB.histories.length;
  }

  int totalQuizDone() {
    return FakeDB.histories.length;
  }
}
