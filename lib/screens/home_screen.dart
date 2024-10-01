import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 22),
            _buildLogo(),
            const SizedBox(height: 22),
            _buildPoint(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset('assets/images/logo.svg');
  }

  Widget _buildPoint() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: const Column(
        children: [
          Text(
            "내 적립 포인트",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "450,000",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7171),
                ),
              ),
              Text(
                " 원",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          GradientText(
            text: "총 45시간 동안 더위를 피했어요",
            style: TextStyle(
              fontSize: 20,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7171),
                Color(0xFF629CFF),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
