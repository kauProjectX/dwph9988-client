import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'card_news1_screen.dart';
import 'card_news2_screen.dart';
import '../point_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildRewardSection(context), // context 전달
            const SizedBox(height: 20),
            _buildCardNewsSection(context), // context 전달
            const SizedBox(height: 30),
            _buildCallButton(),
          ],
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

  // 어르신용 & 리워드 버튼 섹션
  Widget _buildRewardSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '어르신용',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PointDetailScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFF7171),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.monetization_on, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    '리워드 28,300원',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardNewsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCardNewsItem(
            context,
            'card_news_1',
            '여름철 주의해야할\n온열질환\n',
            '규칙적인 운동과 균형잡힌 식단으로 건강한 노후 생활을 즐기세요.',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardNewsScreenOne(),
                ),
              );
            },
          ),
          _buildCardNewsItem(
            context,
            'card_news_2',
            '기후변화SOS캠페인\n폭염에서 살아남기\n',
            '두뇌 활동과 사회적 교류로 치매 위험을 줄일 수 있습니다.',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardNewsScreenTwo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 카드뉴스 아이템
  Widget _buildCardNewsItem(
    BuildContext context,
    String imageName,
    String title,
    String description,
    VoidCallback onTap, // onTap 전달
  ) {
    double containerWidth = MediaQuery.of(context).size.width * 0.45;
    double containerHeight = containerWidth + 180; // 이미지 1:1 + 텍스트 높이 고정

    return GestureDetector(
      onTap: onTap, // 전달받은 onTap 호출
      child: Container(
        width: containerWidth,
        height: containerHeight, // 고정된 컨테이너 세로 길이
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFF7171), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/$imageName.png',
                width: containerWidth,
                height: containerWidth, // 1:1 비율
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 하단 전화기 버튼
  Widget _buildCallButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // 배경색 설정
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFF7171), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/call_color.svg',
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              '자식에게 전화 걸기',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFFFF7171),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
