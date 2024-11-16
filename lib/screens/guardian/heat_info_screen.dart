import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class GuardianHeatInfoScreen extends StatelessWidget {
  const GuardianHeatInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE5E5),
        title: const Text('폭염 정보'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heat Alert Settings Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ph_bell-fill.svg',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '폭염 알림 설정',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '현재 설정: 일 최고 기온 22°C 이상',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.edit),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Temperature Cards Row
                Row(
                  children: [
                    Expanded(
                      child: _buildTemperatureCard(
                        '어머니 지역 날씨',
                        '경상북도 영주시',
                        '35°C',
                        '체감 온도 37.5°C',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTemperatureCard(
                        '아버지 지역 날씨',
                        '고양시 덕양구',
                        '30°C',
                        '체감 온도 33°C',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Map Cards
                _buildMapCard(
                  '어머니 근처 가까운 무더위 쉼터 찾기',
                  context,
                  lat: 36.870592,
                  lng: 128.531593,
                ),
                const SizedBox(height: 16),
                _buildMapCard(
                  '아버지 근처 가까운 무더위 쉼터 찾기',
                  context,
                  lat: 37.6037589,
                  lng: 126.8666034,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTemperatureCard(
    String title,
    String location,
    String temperature,
    String feelTemp,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/fluent_people-24-filled.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(location),
          Text(
            temperature,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(feelTemp),
        ],
      ),
    );
  }

  Widget _buildMapCard(
    String title,
    BuildContext context, {
    required double lat,
    required double lng,
  }) {
    final String message = title.contains('어머니')
        ? '어머니에게 앱을 켜 달라는 알림을 보냈습니다'
        : '아버지에게 앱을 켜 달라는 알림을 보냈습니다';

    // 현재 시각에서 0~600초 사이의 랜덤값을 뺀 시각 계산
    final now = DateTime.now();
    final random = DateTime.now().subtract(
      Duration(seconds: (DateTime.now().millisecondsSinceEpoch % 601)),
    );
    final formattedTime = "${random.hour.toString().padLeft(2, '0')}:"
        "${random.minute.toString().padLeft(2, '0')}:"
        "${random.second.toString().padLeft(2, '0')}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_round-home.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/dashicons_update.svg',
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '마지막 업데이트 시각: $formattedTime',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(lat, lng),
                  zoom: 15,
                ),
                mapType: NMapType.basic,
                activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
              ),
              onMapReady: (controller) {
                controller.addOverlay(
                  NMarker(
                    id: 'marker',
                    position: NLatLng(lat, lng),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
