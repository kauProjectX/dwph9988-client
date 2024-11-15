import 'dart:convert';

import 'package:dwph9988/screens/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/user_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 70,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final userController = Get.put(UserController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KakaoLoginWebView(
                    onLoginSuccess: (data) {
                      Get.log('Login success: $data');
                      var accessToken = data['result']['accessToken'];
                      UserMode mode =
                          data['result']['user']['userType'] == 'GUARDIAN'
                              ? UserMode.guardian
                              : UserMode.senior;
                      userController.setAccessToken(accessToken);
                      userController.setUserMode(mode);
                      Get.to(() => const AppScreen());
                    },
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/mingcute_kakao-talk-fill.svg',
                  height: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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

class KakaoLoginWebView extends StatefulWidget {
  final void Function(Map<String, dynamic>) onLoginSuccess;

  const KakaoLoginWebView({Key? key, required this.onLoginSuccess})
      : super(key: key);

  @override
  State<KakaoLoginWebView> createState() => _KakaoLoginWebViewState();
}

class _KakaoLoginWebViewState extends State<KakaoLoginWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.contains('/api/members/social/kakao/callback')) {
              _handleCallback(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://dwph9988.shop/api/members/social/kakao'));
  }

  Future<void> _handleCallback(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        widget.onLoginSuccess(data);
      }
    } catch (e) {
      print('Error during callback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 로그인'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

void main() => runApp(const MaterialApp(home: LoginScreen()));
