import 'package:dwph9988/screens/card_news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../components/gradient_text.dart';
import 'point_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 22),
              _buildLogo(),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: () => Get.to(() => PointDetailScreen()),
                child: _buildPoint(),
              ),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: () => Get.to(() => const CardNewsScreen()),
                child: _buildCardNews(),
              ),
              const SizedBox(height: 22),
              _buildParentCallButton(),
              const SizedBox(height: 22),
              _buildWaterTimer(),
              const SizedBox(height: 22),
            ],
          ),
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

  Widget _buildCardNews() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Image.asset('assets/images/card_news.png'),
      ),
    );
  }

  Widget _buildParentCallButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFBAFFD3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LucideIcons.phoneCall,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            "부모님께 안부 전화 드리기",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTimer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFBAF9FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.glassWater,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                "물 먹기 타이머",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "00:59:58",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xFF387278),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: const Text(
              "물을 마셨어요!",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 19),
          const Text(
            "한 시간에 한 컵씩 물을 마시면\n더위를 이겨내는 데 도움이 돼요",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
