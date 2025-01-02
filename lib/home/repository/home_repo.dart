import 'package:hive/hive.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/models/user.dart';

class HomeRepository {
  static String loginBoxName = 'loginUserBox';
  static String usersBox = 'userBox';
  static Future likeTours(User user, Tour tour) async {
    Box<User> userBox = await Hive.openBox<User>(usersBox);
    Box<User> loginBox = await Hive.openBox<User>(loginBoxName);
    if (user.likedTours.contains(tour)) {
      user.likedTours.remove(tour);
    } else {
      user.likedTours.add(tour);
    }
    List<User> users = userBox.values.toList();
    for (int i = 0; i < users.length; i++) {
      if (user.username == users[i].username) {
        userBox.putAt(i, user);
        break;
      }
    }

    loginBox.clear();
    loginBox.add(user);
  }
}
