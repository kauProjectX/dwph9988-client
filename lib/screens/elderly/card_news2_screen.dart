import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardNewsScreenTwo extends StatelessWidget {
  const CardNewsScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "카드 뉴스",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFFFE5E5),
        elevation: 0,
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width - 30,
                        child: PageView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/card_news_2.png',
                              fit: BoxFit.cover, // 이미지 크기를 컨테이너에 맞춤
                              width: MediaQuery.of(context).size.width - 30,
                              height: MediaQuery.of(context).size.width - 30,
                            );
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
                        SvgPicture.asset(
                          'assets/images/material-symbols_quiz.svg',
                          height: 30,
                        ),
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
                        SvgPicture.asset(
                          'assets/images/share-2.svg',
                          height: 30,
                        ),
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
          ),
          Container(
            color: const Color(0xFFF0F0F0),
            child: Column(
              children: [
                // 상단 검은색 줄
                Container(
                  height: 1, // 검은색 줄의 높이
                  color: Colors.black,
                ),
                // 버튼 및 텍스트 섹션
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 50,
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              "이전으로 돌아가기",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
