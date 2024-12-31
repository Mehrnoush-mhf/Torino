import 'package:hive/hive.dart';
import 'package:torino/models/user.dart';

class AuthenticationRepository {
  static String loginBoxName = 'loginUserBox';
  static String usersBox = 'userBox';

  static Future<List<User>> getAllUsers() async {
    Box<User> userBox = await Hive.openBox<User>(usersBox);
    return userBox.values.toList();
  }

  static Future<User> getLastUser() async {
    Box<User> userBox = await Hive.openBox<User>(loginBoxName);
    return userBox.values.first;
  }

  static Future<bool> isUserLoggedIn() async {
    Box<User> loginUserBox = await Hive.openBox<User>(loginBoxName);
    return loginUserBox.isNotEmpty;
  }

  static Future<void> registerUser(User user) async {
    Box<User> userBox = await Hive.openBox<User>(usersBox);
    userBox.add(user);
    Box<User> loginBox = await Hive.openBox<User>(loginBoxName);
    loginBox.add(user);
  }

  static Future<void> logout() async {
    Box<User> loginUserBox = await Hive.openBox<User>(loginBoxName);
    loginUserBox.clear();
  }

  static Future clearBox() async {
    Box<User> userBox = await Hive.openBox<User>(usersBox);
    userBox.clear();
  }
}
