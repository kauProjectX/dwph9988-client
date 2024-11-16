import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/openapi.dart';
import 'package:url_launcher/url_launcher.dart';

class ElderlyHeatInfoScreen extends StatefulWidget {
  const ElderlyHeatInfoScreen({super.key});

  @override
  State<ElderlyHeatInfoScreen> createState() => _ElderlyHeatInfoScreenState();
}

class _ElderlyHeatInfoScreenState extends State<ElderlyHeatInfoScreen> {
  NaverMapController? _mapController;
  NLatLng? _currentLocation;
  String? _temperature;
  String? _feelTemperature;
  String? _address;
  List<Shelter>? _shelters;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _currentLocation = NLatLng(position.latitude, position.longitude);
      _temperature = '31°C';
      _feelTemperature = '체감 온도 33°C';
      _address = '고양시 일산서구';
    });

    if (_mapController != null && _currentLocation != null) {
      _mapController!.updateCamera(
        NCameraUpdate.withParams(
          target: _currentLocation!,
          zoom: 15,
        ),
      );
    }

    if (_currentLocation != null) {
      final api = Openapi().getSheltersApi();
      final response = await api.apiSheltersGet(
        latitude: _currentLocation!.latitude,
        longitude: _currentLocation!.longitude,
      );

      setState(() {
        _shelters = response.data!.data?.toList();
      });

      if (_mapController != null) {
        _updateMarkers();
      }
    }
  }

  void _updateMarkers() {
    _mapController?.clearOverlays();

    _mapController?.addOverlay(
      NMarker(
        id: 'current',
        position: _currentLocation!,
        caption: NOverlayCaption(
          text: '현위치',
          textSize: 15,
        ),
        icon: NOverlayImage.fromAssetImage(
            'assets/images/tabler_user-filled.png'),
      ),
    );

    _shelters?.asMap().forEach((i, shelter) {
      _mapController?.addOverlay(
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
          icon: NOverlayImage.fromAssetImage('assets/images/mdi_location.png'),
        ),
      );
    });
  }

  void _updateCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLocation = NLatLng(position.latitude, position.longitude);
    });

    if (_mapController != null) {
      _mapController!.updateCamera(
        NCameraUpdate.withParams(
          target: _currentLocation!,
          zoom: 15,
        ),
      );
      _updateMarkers();
    }
  }

  Widget _buildShelterNavigationButton(Shelter shelter) {
    return ElevatedButton(
      onPressed: () async {
        final Uri mapUri = Uri.parse(
          'nmap://route/walk?dlat=${shelter.latitude}&dlng=${shelter.longitude}'
          '&dname=${Uri.encodeComponent(shelter.name!)}'
          '&appname=kr.youngminz.dwph9988',
        );

        try {
          if (await canLaunchUrl(mapUri)) {
            await launchUrl(mapUri);
          } else {
            // 네이버 지도 앱이 없을 경우 alert
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('네이버 지도 앱이 없습니다'),
              ),
            );
          }
        } catch (e) {
          debugPrint('지도 앱 실행 실패: $e');
        }
      },
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
    );
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
                // Heat Alert Settings (폭염 알림 설정)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white, // 배경색 추가
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
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            '재난 알림 - 폭염',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '2024-08-16  11:49:30 AM\n\n오늘(11일) 11:00부로 폭염경보가 발효되었습니다. 가급적 야외활동을 자제하여 주시고 충분한 수분을 섭취바랍니다.\n\n울산광역시 (연락처:052-229-405)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Current Weather (현재 지역 날씨)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white, // 배경색 추가
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
                      _address == null
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFFF7171),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _address!,
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  _temperature!,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  _feelTemperature!,
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Nearby Shelter Search (가까운 무더위 쉼터 찾기)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white, // 배경색 추가
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
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white, // 배경색 추가
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: _currentLocation == null
                                ? const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: Color(0xFFFF7171),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          '현재 위치를 확인하는 중입니다...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : NaverMap(
                                    options: NaverMapViewOptions(
                                      initialCameraPosition: NCameraPosition(
                                        target: _currentLocation!,
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
                                      _mapController = controller;
                                      _updateMarkers();
                                    },
                                  ),
                          ),
                          if (_currentLocation != null)
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: ElevatedButton(
                                onPressed: _updateCurrentLocation,
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
                        children: _shelters
                                ?.map(
                                  (shelter) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          shelter.name ?? '',
                                          style: const TextStyle(fontSize: 22),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      _buildShelterNavigationButton(shelter),
                                    ],
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Reward Button
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color(0xFFFF7171), width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icon_pig.svg',
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFFF7171),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '리워드 받기',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFFF7171),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Call Button
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color(0xFFFF7171), width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icon_call.svg',
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFFF7171),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '보호자에게 전화 걸기',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFFF7171),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
