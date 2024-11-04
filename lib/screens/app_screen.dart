import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../controllers/user_controller.dart';
import 'elderly/heat_info_screen.dart';
import 'emergency_screen.dart';
import 'guardian/heat_info_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _screenIndex = 0;

  final List<Widget> _screenList = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: IndexedStack(
          index: _screenIndex,
          children: _screenList,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _screenIndex,
          onDestinationSelected: (value) {
            if (_screenList[value] is Container) {
              if (value == 1) {
                if (Get.find<UserController>().isGuardian) {
                  _screenList[value] = const GuardianHeatInfoScreen();
                } else {
                  _screenList[value] = const ElderlyHeatInfoScreen();
                }
              } else if (value == 2) {
                _screenList[value] = const EmergencyScreen();
              } else if (value == 3) {
                _screenList[value] = const SettingsScreen();
              }
            }

            HapticFeedback.mediumImpact();
            setState(() => _screenIndex = value);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(LucideIcons.house),
              label: '홈',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.sun),
              label: '폭염 정보',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.ambulance),
              label: '긴급 서비스',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.settings),
              label: '설정',
            ),
          ],
        ),
      ),
    );
  }
}
