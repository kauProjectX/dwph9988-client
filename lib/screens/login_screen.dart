import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'sign_up_screen.dart';
import 'app_screen.dart';
import 'find_idpw_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                _buildLogo(),
                const SizedBox(height: 10),
                const Text(
                  '고령자 온열 질환 예방 서비스',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                _buildInputFields(),
                const SizedBox(height: 50),
                _buildLoginButton(context),
                const SizedBox(height: 20),
                _buildSignUpButton(),
                const SizedBox(height: 0),
                _buildFindCredentialsButton(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 70,
    );
  }

  Widget _buildInputFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: SizedBox(
        width: 270,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: '아이디',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: '비밀번호',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const AppScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF7171),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          '로그인',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Get.to(() => const SignUpScreen());
      },
      child: const Text(
        '회원가입',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildFindCredentialsButton() {
    return TextButton(
      onPressed: () {
        Get.to(() => const FindIDPWScreen());
      },
      child: const Text(
        '아이디/비밀번호 찾기',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
