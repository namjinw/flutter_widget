import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverViewScreen extends StatefulWidget {
  final Widget child; // 위젯 매개변수
  const OverViewScreen({super.key, required this.child});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen>
    with WidgetsBindingObserver {
  // 앱 상태 변화 감지 mixin
  late String text;
  bool flag = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); // 객체 추가
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 객체 삭제
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱 상태 변화 시 호출되는 콜백 함수
    print('앱 상태: ${state}');
    if (state == AppLifecycleState.resumed) {
      // 앱이 화면에 보인다면
      flag = false;
      setState(() {});
    } else if (state == AppLifecycleState.inactive) {
      // 앱 화면 에서 벗어나면
      flag = true;
      setState(() {});
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Over(), // 오버레이 시 보여줄 화면
        ],
      ),
    );
  }

  Widget Over() => IgnorePointer(
    ignoring: true, // 모든 이벤트 차단
    child: Opacity(
      opacity: flag ? 1 : 0,
      child: content(), // 요소
    ),
  );

  Widget content() => Container(
    decoration: BoxDecoration(
      color: Colors.lightBlueAccent,
      image: DecorationImage(
        image: AssetImage('assets/image.jpeg'),
        fit: BoxFit.contain,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Text(
                '응 안보여줌 ㅅㄱ',
                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
