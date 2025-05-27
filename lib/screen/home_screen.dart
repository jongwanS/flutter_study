import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL을 생성하는데 도움을 주는 클래스
final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  /*
      setNavigationDelegate
       > 페이지가 로딩되거나 이동될 때 어떤 행동을 할지를 설정
       > 웹페이지가 모두 로드된 후  print(url); 실행
      loadRequest
       > 실제로 웹 페이지를 로딩
  */
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url){
          print(url);
        }
    ))
    ..loadRequest(uri); // ❶ 컨트롤러 변수 생성

  /*
      화면 UI 그리기 (build 함수)
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold - 앱 화면의 기본 구조를 잡는 위젯 (AppBar + Body)
      appBar: AppBar(
        // ➊ 앱바 위젯 추가
        // ➋ 배경색 지정
        backgroundColor: Colors.orange,
        // ➌ 앱 타이틀 설정
        title: Text('Code Factory'),
        // ➍ 가운데 정렬
        centerTitle: true,
        actions: [
          IconButton(
            // ➋ 눌렀을 때 콜백 함수 설정
            onPressed: () {
              // ➌ 웹뷰에서 보여줄 사이트 실행하기
              controller.loadRequest(Uri.parse('https://m.naver.com'));
            },

            // ➍ 홈 버튼 아이콘 설정
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        // ❷ WebView 추가하기
        controller: controller, //Flutter 앱의 화면(body)에 웹사이트를 보여주는 코드
      ),
    );
  }
}