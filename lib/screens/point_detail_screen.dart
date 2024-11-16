import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PointHistory {
  final String date;
  final String description;
  final int point;
  final int balance;

  PointHistory({
    required this.date,
    required this.description,
    required this.point,
    required this.balance,
  });
}

class PointDetailScreen extends StatelessWidget {
  PointDetailScreen({super.key});

  final formatter = NumberFormat.decimalPatternDigits(locale: 'en_us');

  final List<PointHistory> _pointHistories = [
    PointHistory(
      date: "07.25",
      description: "부모님께 안부 전화",
      point: 100,
      balance: 28300,
    ),
    PointHistory(
      date: "07.24",
      description: "카드 뉴스 퀴즈",
      point: 50,
      balance: 28250,
    ),
    PointHistory(
      date: "07.24",
      description: "부모님께 안부 전화",
      point: 100,
      balance: 28150,
    ),
    PointHistory(
      date: "07.23",
      description: "무더위 쉼터 방문하기",
      point: 200,
      balance: 27950,
    ),
    PointHistory(
      date: "07.22",
      description: "부모님께 안부 전화",
      point: 100,
      balance: 27850,
    ),
    PointHistory(
      date: "07.21",
      description: "무더위 쉼터 방문하기",
      point: 200,
      balance: 27650,
    ),
    PointHistory(
      date: "07.20",
      description: "카드 뉴스 퀴즈",
      point: 50,
      balance: 27600,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 적립 포인트'),
        backgroundColor: const Color(0xFFFFE5E5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFFFE5E5),
              child: _buildHeader(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              child: _buildPointHistoryList(),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 22),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "28,300 ",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "원",
              style: TextStyle(
                fontSize: 40,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 29),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 27),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LucideIcons.piggyBank),
              SizedBox(width: 10),
              Text(
                "지역 화폐로 변환하기",
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
        ),
        const SizedBox(height: 37),
      ],
    );
  }

  Widget _buildPointHistoryList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _pointHistories.length,
      itemBuilder: (context, index) {
        final pointHistory = _pointHistories[index];
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    pointHistory.date,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  pointHistory.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${formatter.format(pointHistory.point)}원',
                      style: TextStyle(
                        fontSize: 14,
                        color: pointHistory.point < 0
                            ? Colors.black
                            : const Color(0xFF46B2FF),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${formatter.format(pointHistory.balance)}원',
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
