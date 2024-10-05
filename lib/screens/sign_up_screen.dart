import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

// Enum for radio button selection
enum UserRole { guardian, senior }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserRole? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  _buildLogo(),
                  const SizedBox(height: 40),
                  const Text(
                    '회원 가입',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('이름'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('아이디'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('비밀번호', obscureText: true),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('비밀번호 확인', obscureText: true),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('연락처',
                        keyboardType: TextInputType.phone),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: _buildTextField('생년월일',
                        keyboardType: TextInputType.datetime),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('보호자'),
                          Radio<UserRole>(
                            value: UserRole.guardian,
                            groupValue: _selectedRole,
                            onChanged: (UserRole? value) {
                              setState(() {
                                _selectedRole = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 70),
                      Row(
                        children: [
                          const Text('어르신'),
                          Radio<UserRole>(
                            value: UserRole.senior,
                            groupValue: _selectedRole,
                            onChanged: (UserRole? value) {
                              setState(() {
                                _selectedRole = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7171),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        '가입 완료',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 50,
    );
  }

  Widget _buildTextField(String label,
      {bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
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
    );
  }
}
