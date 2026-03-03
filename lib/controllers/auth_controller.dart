import '../models/user_model.dart';
import '../data/fake_db.dart';

class AuthController {
  bool login(String email, String password) {
    for (var user in FakeDB.users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }

  bool register(String email, String password, String confirm) {
    if (password != confirm) return false;
    for (var user in FakeDB.users) {
      if (user.email == email) {
        return false;
      }
    }
    FakeDB.users.add(
      UserModel(email: email, password: password),
    );
    return true;
  }
}
