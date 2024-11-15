import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import 'app_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 70,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Text('모드 선택'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('보호자 모드'),
                    onTap: () {
                      Get.find<UserController>().setUserMode(UserMode.guardian);
                      Get.back();
                      Get.to(() => const AppScreen());
                    },
                  ),
                  ListTile(
                    title: const Text('노약자 모드'),
                    onTap: () {
                      Get.find<UserController>().setUserMode(UserMode.senior);
                      Get.back();
                      Get.to(() => const AppScreen());
                    },
                  ),
                ],
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF7171),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          '카카오 로그인',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F7),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  '고령자 온열 질환 예방 서비스',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFF7171),
                  ),
                ),
              ),
            ),
            _buildLogo(),
            const SizedBox(height: 50),
            _buildLoginButton(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: LoginScreen()));
