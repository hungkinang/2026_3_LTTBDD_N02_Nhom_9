import '../models/user_model.dart';
import '../models/history_model.dart';

class FakeDB {
  static List<UserModel> users = [
    UserModel(email: "admin@gmail.com", password: "123456"),
  ];
  static List<HistoryModel> histories = [];
}
