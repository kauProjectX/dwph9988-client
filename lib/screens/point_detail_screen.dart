import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PointDetailScreen extends StatelessWidget {
  const PointDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 적립 포인트'),
        backgroundColor: const Color(0xFFFFE5E5),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFFFE5E5),
          child: _buildHeader(),
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
              "450,000 ",
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
                "인출하기",
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
        ),
        const SizedBox(height: 37),
      ],
    );
  }
}
