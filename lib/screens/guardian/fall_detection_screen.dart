import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class GuardianFallDetectionScreen extends StatefulWidget {
  const GuardianFallDetectionScreen({super.key});

  @override
  State<GuardianFallDetectionScreen> createState() =>
      _GuardianFallDetectionScreenState();
}

class _GuardianFallDetectionScreenState
    extends State<GuardianFallDetectionScreen> {
  bool _isFallDetected = false;
  DateTime? _fallDetectedTime;

  @override
  void initState() {
    super.initState();
    // 5초 후에 낙상 감지 시뮬레이션
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isFallDetected = true;
          _fallDetectedTime = DateTime.now();
        });
        _showFallAlert();
      }
    });
  }

  void _showFallAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('낙상 감지 알림'),
        content: Text(
          '어르신이 넘어진 것을 확인했습니다.\n'
          '발생 시각: ${DateFormat('HH:mm:ss').format(_fallDetectedTime!)}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  Future<void> _callElderly() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '010-1234-1234');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위험 감지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/fa6-solid_person-falling-burst.svg',
              width: 100,
              height: 100,
              colorFilter: ColorFilter.mode(
                _isFallDetected ? const Color(0xFFFF7171) : Colors.green,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isFallDetected
                  ? '어르신이 넘어진 것을 확인했습니다.\n'
                      '발생 시각: ${DateFormat('HH:mm:ss').format(_fallDetectedTime!)}'
                  : '어르신이 안전한 상태입니다.',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            if (_isFallDetected)
              ElevatedButton(
                onPressed: _callElderly,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7171),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  '어르신에게 연락하기',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
