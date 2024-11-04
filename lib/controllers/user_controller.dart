import 'package:get/get.dart';

enum UserMode { guardian, senior }

class UserController extends GetxController {
  final Rx<UserMode?> userMode = Rx<UserMode?>(null);

  void setUserMode(UserMode mode) {
    userMode.value = mode;
  }

  bool get isGuardian => userMode.value == UserMode.guardian;
  bool get isSenior => userMode.value == UserMode.senior;
}
