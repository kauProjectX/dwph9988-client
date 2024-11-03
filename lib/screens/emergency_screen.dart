import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("긴급 서비스"),
        backgroundColor: const Color(0xFFFFE5E5),
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Colors.black, width: 0.7),
                    ),
                    elevation: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(35.0),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.siren,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '112 신고',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Colors.black, width: 0.7),
                    ),
                    elevation: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(35.0),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.ambulance,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '119 신고',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAFFD3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 0.7),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text(
                "어머니 위치 확인",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAFFD3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 0.7),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text(
                "아버지 위치 확인",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAFFD3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 0.7),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text(
                "어머니 지역 긴급 재난 문자 확인",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBAFFD3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 0.7),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text(
                "아버지 지역 긴급 재난 문자 확인",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: EmergencyScreen()));
