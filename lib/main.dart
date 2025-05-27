import 'package:flutter/material.dart';
import 'package:flutterstudy/screen/home_screen.dart';
//import 'package:';
/**
    https://github.com/codefactory-co/flutter-golden-rabbit-novice-v3
 */
void main() {
  /**
      앱 실행 전에 필요한 바인딩을 반드시 준비시키는 안전장치 역할
      main() 함수에서 비동기 작업을 하기 전에 호출
   */
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}