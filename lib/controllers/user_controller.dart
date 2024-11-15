import 'package:get/get.dart';

enum UserMode { guardian, senior }

class UserController extends GetxController {
  final Rx<UserMode?> userMode = Rx<UserMode?>(null);
  String? _accessToken;

  void setUserMode(UserMode mode) {
    userMode.value = mode;
  }

  bool get isGuardian => userMode.value == UserMode.guardian;
  bool get isSenior => userMode.value == UserMode.senior;

  void setAccessToken(String token) {
    _accessToken = token;
  }

  String? get accessToken => _accessToken;
}
