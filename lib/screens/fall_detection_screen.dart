import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';

import 'elderly/heat_info_screen.dart';

class FallDetectionScreen extends StatefulWidget {
  const FallDetectionScreen({super.key});

  @override
  State<FallDetectionScreen> createState() => _FallDetectionScreenState();
}

class _FallDetectionScreenState extends State<FallDetectionScreen> {
  static const double _fallThreshold = 25.0; // 임계값 상향 조정

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _isFallDetected = false;
  List<double> _currentAcceleration = [0, 0, 0];
  final AudioPlayer _player = AudioPlayer();
  StreamSubscription<Position>? _positionSubscription;
  Position? _referencePosition; // 기준점
  Position? _lastPosition; // 마지막 위치
  DateTime? _stationaryStartTime;

  // 상수
  static const double _movementThreshold = 10.0; // meters
  static const int _stationaryThresholdMinutes = 1;

  // 상태
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _startListening();
    _startLocationTracking();
  }

  Future<void> _startLocationTracking() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    _positionSubscription =
        Geolocator.getPositionStream().listen(_handleGpsSignal);
  }

  void _handleGpsSignal(Position position) {
    setState(() {
      _lastPosition = position;

      if (_isInitializing) {
        _isInitializing = false;
        _referencePosition = position;
        _stationaryStartTime = DateTime.now();
        return;
      }

      // 기준점과의 거리 체크
      final distance = Geolocator.distanceBetween(
        _referencePosition!.latitude,
        _referencePosition!.longitude,
        position.latitude,
        position.longitude,
      );

      if (distance >= _movementThreshold) {
        // 10m 이상 이동: 새로운 기준점 설정
        _referencePosition = position;
        _stationaryStartTime = DateTime.now();
      } else if (_stationaryStartTime != null) {
        // 정지 시간 체크
        final stationaryDuration =
            DateTime.now().difference(_stationaryStartTime!);
        if (stationaryDuration.inMinutes >= _stationaryThresholdMinutes) {
          _showHeatAlert();
          _referencePosition = position;
          _stationaryStartTime = DateTime.now();
        }
      }
    });
  }

  String _getMovementStatus() {
    if (_isInitializing ||
        _lastPosition == null ||
        _referencePosition == null) {
      return '-';
    }

    final distance = Geolocator.distanceBetween(
      _referencePosition!.latitude,
      _referencePosition!.longitude,
      _lastPosition!.latitude,
      _lastPosition!.longitude,
    );

    return _stationaryStartTime != null
        ? '${distance.toStringAsFixed(1)}m (${_formatDuration(DateTime.now().difference(_stationaryStartTime!))} 전 대비)'
        : '${distance.toStringAsFixed(1)}m (이동 중)';
  }

  void _showHeatAlert() {
    int remainingSeconds = 10;
    Timer? countdownTimer;
    bool isPlaying = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          countdownTimer?.cancel();
          countdownTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) async {
              remainingSeconds--;

              if (remainingSeconds <= 5 && !isPlaying) {
                isPlaying = true;
                await _player.setReleaseMode(ReleaseMode.loop);
                await _player.play(AssetSource('sfx/siren.wav'));
              }

              if (remainingSeconds <= 0) {
                timer.cancel();
                _player.stop();
                Navigator.of(context).pop();

                final Uri phoneUri = Uri(scheme: 'tel', path: '010-1234-1234');
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                }
              } else {
                setState(() {});
              }
            },
          );

          return AlertDialog(
            title: const Text('장시간 정지 감지'),
            content: const Text(
                '현재 야외에서 장시간 정지 상태입니다. 괜찮으신가요?\n10초 이내에 응답이 없으면 119와 보호자에게 자동으로 연락됩니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  countdownTimer?.cancel();
                  _player.stop();
                  Navigator.of(context).pop();
                  _showShelterRecommendation();
                },
                child: const Text('괜찮습니다'),
              ),
              TextButton(
                onPressed: () async {
                  countdownTimer?.cancel();
                  _player.stop();
                  final Uri phoneUri =
                      Uri(scheme: 'tel', path: '010-1234-1234');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  }
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
      _player.stop();
    });
  }

  void _showShelterRecommendation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('무더위 쉼터 안내'),
        content:
            const Text('더운 날씨에는 무더위 쉼터를 이용하시는 것이 좋습니다.\n가까운 무더위 쉼터를 안내해드릴까요?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('괜찮습니다'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showShelterGuide();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: const Text('무더위 쉼터 보기'),
          ),
        ],
      ),
    );
  }

  void _showShelterGuide() {
    Navigator.pop(context);
    Get.to(() => const ElderlyHeatInfoScreen());
  }

  void _startListening() {
    _accelerometerSubscription =
        SensorsPlatform.instance.accelerometerEventStream().listen((event) {
      setState(() {
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
    bool isPlaying = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          countdownTimer?.cancel();
          countdownTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) async {
              remainingSeconds--;

              // 5초 이하일 때 사이렌 재생 시작
              if (remainingSeconds <= 5 && !isPlaying) {
                isPlaying = true;
                await _player.setReleaseMode(ReleaseMode.loop); // 반복 재생 설정
                await _player.play(AssetSource('sfx/siren.wav'));
              }

              if (remainingSeconds <= 0) {
                timer.cancel();
                _player.stop(); // 사이렌 중지
                Navigator.of(context).pop();

                final Uri phoneUri = Uri(scheme: 'tel', path: '010-1234-1234');
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                }

                this.setState(() => _isFallDetected = false);
              } else {
                setState(() {});
              }
            },
          );

          return AlertDialog(
            title: const Text('낙상이 감지되었습니다!'),
            content:
                const Text('괜찮으신가요?\n10초 이내에 응답이 없으면 119와 보호자에게 자동으로 연락됩니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  countdownTimer?.cancel();
                  _player.stop(); // 사이렌 중지
                  this.setState(() => _isFallDetected = false);
                  Navigator.of(context).pop();
                },
                child: const Text('괜찮습니다'),
              ),
              TextButton(
                onPressed: () async {
                  countdownTimer?.cancel();
                  _player.stop(); // 사이렌 중지
                  this.setState(() => _isFallDetected = false);
                  final Uri phoneUri =
                      Uri(scheme: 'tel', path: '010-1234-1234');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  }
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
      _player.stop(); // 사이렌 중지
      setState(() => _isFallDetected = false);
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes분 $seconds초';
  }

  @override
  void dispose() {
    _player.dispose();
    _accelerometerSubscription?.cancel();
    _positionSubscription?.cancel();
    super.dispose();
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
              colorFilter: const ColorFilter.mode(
                Color(0xFFFF7171),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isFallDetected ? '낙상이 감지되었습니다!' : '위험 감지 중...',
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
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      '현재 GPS 위치 값',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '현재 위치: ${_lastPosition?.latitude.toStringAsFixed(6) ?? 'N/A'}, '
                      '${_lastPosition?.longitude.toStringAsFixed(6) ?? 'N/A'}\n'
                      '이동 거리: ${_getMovementStatus()}',
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
