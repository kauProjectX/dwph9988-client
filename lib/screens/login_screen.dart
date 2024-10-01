import 'package:dwph9988/screens/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Login Screen'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text('회원가입 페이지로 이동'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const AppScreen());
                },
                child: const Text('앱 메인 화면으로 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
