import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class ElderlyHeatInfoScreen extends StatelessWidget {
  const ElderlyHeatInfoScreen({super.key});

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
                // Heat Alert Settings
                Container(
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
                            'assets/images/ph_bell-fill.svg',
                            width: 48,
                            height: 48,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            '폭염 알림 설정',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF7171),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/pencil.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '수정',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: '일 최고 기온 ',
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontSize: 23),
                          children: [
                            TextSpan(
                              text: '30°C',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF7171),
                              ),
                            ),
                            TextSpan(
                              text: ' 이상',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Current Weather
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/marker.svg',
                            width: 48,
                            height: 48,
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            '현재 지역 날씨',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '고양시 일산서구',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const Text(
                        '31°C',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        '체감 온도 33°C',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Nearby Shelter Search
                Container(
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
                            width: 48,
                            height: 48,
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            '가까운 무더위 쉼터 찾기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: NaverMap(
                              options: NaverMapViewOptions(
                                initialCameraPosition: NCameraPosition(
                                  target: NLatLng(37.6037589, 126.8666034),
                                  zoom: 15,
                                ),
                                mapType: NMapType.basic,
                                activeLayerGroups: [
                                  NLayerGroup.building,
                                  NLayerGroup.transit
                                ],
                                rotationGesturesEnable: false,
                                scrollGesturesEnable: true,
                                tiltGesturesEnable: false,
                                zoomGesturesEnable: true,
                                stopGesturesEnable: false,
                              ),
                              onMapReady: (controller) {
                                controller.addOverlay(
                                  NMarker(
                                    id: 'marker',
                                    position: NLatLng(37.6037589, 126.8666034),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF7171),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/dashicons_update.svg',
                                    width: 30,
                                    height: 30,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '현위치 업데이트',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '○○어르신 복지센터',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFE5E5),
                                  side: const BorderSide(
                                    color: Color(0xFFFF7171),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                ),
                                child: const Text(
                                  '안내하기',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFFF7171),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '○○안전숙소',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFE5E5),
                                  side: const BorderSide(
                                    color: Color(0xFFFF7171),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                ),
                                child: const Text(
                                  '안내하기',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFFF7171),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '은행춘당',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFE5E5),
                                  side: const BorderSide(
                                    color: Color(0xFFFF7171),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                ),
                                child: const Text(
                                  '안내하기',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFFF7171),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
