import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL을 생성하는데 도움을 주는 클래스
final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();


  @override
  void initState(){
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
        (timer){
          print('실행!');
          int? nextPage = pageController.page?.toInt();
          if (nextPage == null) {
            return;
          }
          // ➌
          if (nextPage == 3) {
            nextPage = 0;
          } else {
            nextPage++;
          }
          pageController.animateToPage(
            // ➍ 페이지 변경
            nextPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
          controller: pageController,
          children: [1,2,3,4]
              .map(
                (number) => Image.asset(
              'assets/image_$number.png',
              fit: BoxFit.cover,
            ),
          ).toList()
      ),
    );
  }

}