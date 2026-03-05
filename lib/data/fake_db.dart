import '../models/user_model.dart';
import '../models/history_model.dart';

class FakeDB {
  static List<UserModel> users = [
    UserModel(email: "admin@gmail.com", password: "123456"),
  ];
  static List<HistoryModel> histories = [
    HistoryModel(
      title: "Toán Cơ Bản",
      score: 8,
      total: 10,
      date: "12/03/2022",
    ),
    HistoryModel(
      title: "Ngữ Pháp Tiếng Anh",
      score: 7,
      total: 10,
      date: "10/03/2022",
    ),
    HistoryModel(
      title: "Vật Lý Lớp 10",
      score: 9,
      total: 10,
      date: "08/03/2022",
    ),
  ];
}
