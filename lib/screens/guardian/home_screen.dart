import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../point_detail_screen.dart';
import '../guardian/card_news1_screen.dart';
import '../guardian/card_news2_screen.dart';
import '../guardian/card_news3_screen.dart';

class GuardianHomeScreen extends StatelessWidget {
  const GuardianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // ListView로 변경하여 스크롤 가능하게 수정
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildGuardianLabel(),
            const SizedBox(height: 20),
            _buildCardNewsSection(context),
            const SizedBox(height: 20),
            _buildCallButtons(),
            const SizedBox(height: 20),
            _buildRecentAlerts(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '고령자 온열 질환 예방 서비스',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFF7171),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PointDetailScreen()),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/elder_reward.svg',
                      height: 30,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      '28,300원',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 45,
    );
  }

  Widget _buildGuardianLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 115,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '보호자용',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildCardNewsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCardNewsItem(
            context,
            'card_news_1',
            '여름철 주의해야할\n온열질환',
            '규칙적인 운동과 균형잡힌 식단으로 건강한 노후 생활을 즐기세요.',
            const CardNewsScreenOne(),
          ),
          _buildCardNewsItem(
            context,
            'card_news_2',
            '[기후변화 캠페인]\n폭염에서 살아남기',
            '두뇌 활동과 사회적 교류로 치매 위험을 줄일 수 있습니다.',
            const CardNewsScreenTwo(),
          ),
          _buildCardNewsItem(
            context,
            'card_news_3',
            '독거노인, 노숙인\n폭염 대비',
            '폭염이 강한 시간에는 근처 무더위쉼터로 가서 휴식하기.',
            const CardNewsScreenThree(),
          ),
        ],
      ),
    );
  }

  Widget _buildCardNewsItem(
    BuildContext context,
    String imageName,
    String title,
    String description,
    Widget targetScreen,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        child: Container(
          height: 260, // 컨테이너 높이 증가
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFF7171), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/$imageName.png',
                  height: 120, // 이미지 높이 증가
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCallButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF7171), // 배경색 설정
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/call.svg',
                    height: 28,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '어머니에게\n안부전화 드리기',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF629CFF), // 배경색 설정
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/call.svg',
                    height: 28,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '아버지에게\n안부전화 드리기',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAlerts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ph_bell-fill.svg',
                height: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                '종합 기상정보 알림',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _AlertRow(message: '일산은 오늘 낮 최고기온이 31도까지 올라 무더워요.'),
                _AlertRow(message: '오늘 부모님께 안부 전화를 드려보는 건 어떨까요?'),
                _AlertRow(
                    message:
                        '야외활동과 외출은 자제하고, 물을 자주 드시면서 충분한 휴식을 취하시라고 어르신들께 안내 부탁드려요.'),
                _AlertRow(message: '내일 새벽부터 비소식이 있어요.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlertRow extends StatelessWidget {
  const _AlertRow({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 메시지가 여러 줄일 때 정렬
        children: [
          // 작은 분홍색 동그라미 추가
          Container(
            width: 10, // 동그라미의 너비
            height: 10, // 동그라미의 높이
            margin: const EdgeInsets.only(top: 5), // 동그라미 위치 조정
            decoration: const BoxDecoration(
              color: Color(0xFFFFC0CB), // 분홍색
              shape: BoxShape.circle, // 원 모양
            ),
          ),
          const SizedBox(width: 10), // 동그라미와 메시지 간격
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF888888),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
