import 'package:labasDoctor/models/userdatamodel.dart';

class User {
  // singleton
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  static User get userData => _singleton;
  var token;
  UserResult userResult;
  var otp;
  var mobile;
}
