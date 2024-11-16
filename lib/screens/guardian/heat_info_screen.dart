import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/openapi.dart';

class GuardianHeatInfoScreen extends StatefulWidget {
  const GuardianHeatInfoScreen({super.key});

  @override
  State<GuardianHeatInfoScreen> createState() => _GuardianHeatInfoScreenState();
}

class _GuardianHeatInfoScreenState extends State<GuardianHeatInfoScreen> {
  NLatLng? _motherLocation;
  NLatLng? _fatherLocation;
  NaverMapController? _motherMapController;
  NaverMapController? _fatherMapController;

  // 날씨 정보를 담을 변수들
  String? _motherTemp;
  String? _motherFeelTemp;
  String? _fatherTemp;
  String? _fatherFeelTemp;

  // 위치 정보도 nullable로
  String? _motherAddress;
  String? _fatherAddress;

  List<Shelter>? _motherShelters;
  List<Shelter>? _fatherShelters;

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    final SheltersApi api = Openapi().getSheltersApi();

    // 현재 위치 가져오기
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _motherLocation = const NLatLng(36.870592, 128.531593);
      _fatherLocation = NLatLng(position.latitude, position.longitude);

      _motherTemp = '35°C';
      _motherFeelTemp = '체감 온도 37.5°C';
      _fatherTemp = '30°C';
      _fatherFeelTemp = '체감 온도 33°C';

      _motherAddress = '경상북도 영주시';
      _fatherAddress = '고양시 덕양구';
    });

    // 무더위 쉼터 정보 가져오기
    if (_motherLocation != null) {
      final motherResponse = await api.apiSheltersGet(
        latitude: _motherLocation!.latitude,
        longitude: _motherLocation!.longitude,
      );
      setState(() {
        _motherShelters = motherResponse.data!.data?.toList();
      });
      if (_motherMapController != null) {
        _updateMarkers(
          _motherMapController!,
          _motherShelters,
          _motherLocation!,
        );
      }
    }

    if (_fatherLocation != null) {
      final fatherResponse = await api.apiSheltersGet(
        latitude: _fatherLocation!.latitude,
        longitude: _fatherLocation!.longitude,
      );
      setState(() {
        _fatherShelters = fatherResponse.data!.data?.toList();
      });
      if (_fatherMapController != null) {
        _updateMarkers(
          _fatherMapController!,
          _fatherShelters,
          _fatherLocation!,
        );
      }
    }
  }

  void _updateMarkers(
    NaverMapController controller,
    List<Shelter>? shelters,
    NLatLng currentLocation,
  ) {
    // 기존 마커들 제거
    controller.clearOverlays();

    // 현재 위치 마커
    controller.addOverlay(
      NMarker(
        id: 'current',
        position: currentLocation,
        caption: NOverlayCaption(
          text: '현위치',
          textSize: 15,
        ),
        icon: NOverlayImage.fromAssetImage(
          'assets/images/tabler_user-filled.png',
        ),
      ),
    );

    // 쉼터 마커들 추가
    if (shelters != null) {
      for (var i = 0; i < shelters.length; i++) {
        final shelter = shelters[i];
        controller.addOverlay(
          NMarker(
            id: 'shelter_$i',
            position: NLatLng(
              shelter.latitude!.toDouble(),
              shelter.longitude!.toDouble(),
            ),
            caption: NOverlayCaption(
              text: shelter.name!,
              textSize: 15,
            ),
            icon: NOverlayImage.fromAssetImage(
              'assets/images/mdi_location.png',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "폭염 정보",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFFFE5E5),
        elevation: 0,
        centerTitle: true,
        leading: Container(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Heat Alert Settings Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center, // y축 정렬
                        children: [
                          SvgPicture.asset(
                            'assets/images/ph_bell-fill.svg',
                            width: 30,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            '재난 알림 : 폭염',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12), // 아이콘과 내용 사이 간격 추가
                      Text(
                        '오늘 (11일) 11:00부로 폭염경보가 발효되었습니다. 가급적 야외활동을 자제하여 주시고 충분한 수분을 섭취바랍니다.\n울산광역시 (연락처 : 052-229-4052)',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
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
                        _motherAddress,
                        _motherTemp,
                        _motherFeelTemp,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTemperatureCard(
                        '아버지 지역 날씨',
                        _fatherAddress,
                        _fatherTemp,
                        _fatherFeelTemp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Map Cards
                _buildMapCard(
                  '어머니 근처 가까운 무더위 쉼터 찾기',
                  context,
                  lat: _motherLocation?.latitude ?? 36.870592,
                  lng: _motherLocation?.longitude ?? 128.531593,
                ),
                const SizedBox(height: 16),
                _buildMapCard(
                  '아버지 근처 가까운 무더위 쉼터 찾기',
                  context,
                  lat: _fatherLocation?.latitude ?? 37.6037589,
                  lng: _fatherLocation?.longitude ?? 126.8666034,
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
    String? location,
    String? temperature,
    String? feelTemp,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
          if (location == null || temperature == null || feelTemp == null)
            const Center(child: CircularProgressIndicator())
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
    final isMotherMap = title.contains('어머니');
    final currentLocation = NLatLng(lat, lng);

    // 현재 시각에서 0~600초 사이의 랜덤값을 뺀 시각 계산
    final random = DateTime.now().subtract(
      Duration(seconds: (DateTime.now().millisecondsSinceEpoch % 601)),
    );
    final formattedTime = "${random.hour.toString().padLeft(2, '0')}:"
        "${random.minute.toString().padLeft(2, '0')}:"
        "${random.second.toString().padLeft(2, '0')}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
            child: _motherLocation == null || _fatherLocation == null
                ? const Center(child: CircularProgressIndicator())
                : NaverMap(
                    options: NaverMapViewOptions(
                      initialCameraPosition: NCameraPosition(
                        target: currentLocation,
                        zoom: 15,
                      ),
                      mapType: NMapType.basic,
                      activeLayerGroups: [
                        NLayerGroup.building,
                        NLayerGroup.transit
                      ],
                    ),
                    onMapReady: (controller) {
                      if (isMotherMap) {
                        _motherMapController = controller;
                      } else {
                        _fatherMapController = controller;
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _motherMapController?.dispose();
    _fatherMapController?.dispose();
    super.dispose();
  }
}
