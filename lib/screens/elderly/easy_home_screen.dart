import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const SizedBox(height: 0),
              _buildReward(),
              const SizedBox(height: 20),
              _buildMenuGrid(),
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
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildReward() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.redAccent, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/elder_reward.svg', width: 24),
              const SizedBox(width: 8),
              const Text("리워드", style: TextStyle(fontSize: 18)),
            ],
          ),
          const Text("28,300원", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
        children: [
          _buildMenuItem('홈', 'elder_home.svg'),
          _buildMenuItem('폭염 정보', 'elder_sun.svg', isHighlighted: true),
          _buildMenuItem('낙상 감지', 'elder_fall.svg', isHighlighted: true),
          _buildMenuItem('설정', 'elder_setting.svg'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String iconName,
      {bool isHighlighted = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color.fromARGB(255, 230, 130, 130)
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.redAccent, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/$iconName', width: 40),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isHighlighted ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
