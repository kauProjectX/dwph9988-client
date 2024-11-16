import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardNewsScreenThree extends StatelessWidget {
  const CardNewsScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("카드 뉴스"),
        backgroundColor: const Color(0xFFFFE5E5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width - 30,
                  child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Image.asset('assets/images/card_news_3.png');
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/material-symbols_quiz.svg'),
                  const SizedBox(width: 20),
                  const Text(
                    "퀴즈 풀고 포인트 받기",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/share-2.svg'),
                  const SizedBox(width: 20),
                  const Text(
                    "공유하고 포인트 받기",
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
