import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../point_detail_screen.dart';
import '../home_screen.dart';
import '../elderly/heat_info_screen.dart';
import '../settings_screen.dart';
import '../fall_detection_screen.dart';

class ElderEasyHomeScreen extends StatelessWidget {
  const ElderEasyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              _buildHeader(),
              const SizedBox(height: 10),
              _buildQuickHomeLabel(), // 간편 홈 추가
              const SizedBox(height: 15),
              _buildReward(context), // context를 전달
              const SizedBox(height: 25),
              _buildMenuGrid(context), // context를 전달하여 Navigator 사용
            ],
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

  Widget _buildHeader() {
    return Column(
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
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildQuickHomeLabel() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFFF7171),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          '간편 홈',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildReward(BuildContext context) {
    // context를 인자로 추가
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PointDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFFF7171), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/elder_reward.svg', width: 35),
                const SizedBox(width: 8),
                const Text("리워드", style: TextStyle(fontSize: 23)),
              ],
            ),
            const Text("28,300원", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    // context를 인자로 추가
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
        children: [
          _buildMenuItem(
            '홈',
            'elder_home.svg',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
          _buildMenuItem(
            '폭염 정보',
            'elder_sun.svg',
            isHighlighted: true,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ElderlyHeatInfoScreen()),
            ),
          ),
          _buildMenuItem(
            '위험 감지',
            'elder_fall.svg',
            isHighlighted: true,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FallDetectionScreen()),
            ),
          ),
          _buildMenuItem(
            '설정',
            'elder_setting.svg',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String iconName,
      {bool isHighlighted = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isHighlighted ? const Color(0xFFFF7171) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFFF7171), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/$iconName', width: 40),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 23,
                color: isHighlighted ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
