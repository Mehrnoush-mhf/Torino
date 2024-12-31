import 'package:torino/models/tour.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String username;
  @HiveField(1)
  String password;
  @HiveField(2)
  String email;
  @HiveField(3)
  List<Tour> likedTours = [];

  User({
    required this.username,
    required this.email,
    required this.password,
  });
}
