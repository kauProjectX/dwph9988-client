import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CardNewsScreen extends StatelessWidget {
  const CardNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("카드 뉴스"),
        backgroundColor: const Color(0xFFE5F0FF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Image.asset('assets/images/card_news.png');
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 33),
              child: Text(
                "열사병과 일사병은 모두 고온 환경에서 발생할 수 있는 온열 질환이지만, 그 차이점은 심각성에 있습니다. 일사병은 햇볕에 과도하게 노출되어 체온이 상승하면서 두통, 어지럼증, 구토 등의 증상이 나타나는 상태로, 적절한 휴식과 수분 섭취로 회복될 수 있습니다. 반면에 열사병은 체온이 40도 이상으로 급격히 상승하며, 체온 조절 기능이 망가져 혼수상태나 심지어 사망에 이를 수 있는 응급 상황입니다. 열사병은 즉각적인 의료 조치가 필요한 중증 질환입니다.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5625,
                  color: Color(0xFF333333),
                ),
              ),
            ),
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
                  Icon(LucideIcons.gift),
                  SizedBox(width: 10),
                  Text(
                    "퀴즈 풀고 포인트 받기",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
