import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

class FallDetectionScreen extends StatefulWidget {
  const FallDetectionScreen({super.key});

  @override
  State<FallDetectionScreen> createState() => _FallDetectionScreenState();
}

class _FallDetectionScreenState extends State<FallDetectionScreen> {
  static const double _fallThreshold = 25.0; // 임계값 상향 조정
  static const double _updateInterval = 500; // 500ms

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _isFallDetected = false;
  List<double> _currentAcceleration = [0, 0, 0];
  DateTime _lastUpdate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      final now = DateTime.now();
      if (now.difference(_lastUpdate).inMilliseconds < _updateInterval) {
        return; // 업데이트 주기가 되지 않았으면 스킵
      }

      setState(() {
        _lastUpdate = now;
        _currentAcceleration = [event.x, event.y, event.z];

        // 중력 가속도를 제외한 순수 가속도 계산
        double magnitude = _calculateMagnitude(event.x, event.y, event.z);
        double acceleration = magnitude - 9.8; // 중력 가속도 제외

        // 임계값을 넘으면 낙상으로 판단
        if (acceleration > _fallThreshold && !_isFallDetected) {
          _isFallDetected = true;
          _showFallAlert();
        }
      });
    });
  }

  double _calculateMagnitude(double x, double y, double z) {
    return sqrt(x * x + y * y + z * z); // sqrt 추가
  }

  void _showFallAlert() {
    int remainingSeconds = 10;
    Timer? countdownTimer;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          countdownTimer?.cancel();
          countdownTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) {
              remainingSeconds--;
              if (remainingSeconds <= 0) {
                timer.cancel();
                Navigator.of(context).pop();
                // TODO: 여기서 보호자 자동 연락 로직 추가
              } else {
                setState(() {});
              }
            },
          );

          return AlertDialog(
            title: const Text('낙상이 감지되었습니다!'),
            content: const Text('괜찮으신가요?\n10초 이내에 응답이 없으면 보호자에게 자동으로 연락됩니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  countdownTimer?.cancel();
                  setState(() => _isFallDetected = false);
                  Navigator.of(context).pop();
                },
                child: const Text('괜찮습니다'),
              ),
              TextButton(
                onPressed: () {
                  countdownTimer?.cancel();
                  // TODO: 실제 구현시 긴급 연락처로 연결
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: Text('도움이 필요합니다 ($remainingSeconds)'),
              ),
            ],
          );
        },
      ),
    ).then((_) {
      countdownTimer?.cancel();
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('낙상 감지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.accessibility_new,
              size: 100,
              color: Color(0xFFFF7171),
            ),
            const SizedBox(height: 20),
            Text(
              _isFallDetected ? '낙상이 감지되었습니다!' : '낙상 감지 중...',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      '현재 가속도 값',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'X: ${_currentAcceleration[0].toStringAsFixed(2)}\n'
                      'Y: ${_currentAcceleration[1].toStringAsFixed(2)}\n'
                      'Z: ${_currentAcceleration[2].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
