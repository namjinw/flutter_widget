import 'package:flutter/material.dart';
import 'package:totally_lecture/Screen/Second.dart';

class FirstLecture extends StatefulWidget {
  const FirstLecture({super.key});

  @override
  State<FirstLecture> createState() => _FirstLectureState();
}

class _FirstLectureState extends State<FirstLecture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Main title')), // 중앙
        backgroundColor: Colors.lightBlue,
        actions: [
          // 오른쪽
          IconButton(
            onPressed: () {
              print('Actions');
            },
            icon: Icon(Icons.add),
          ),
        ],
        leading: TextButton(
          // 왼쪽
          onPressed: () {
            print('Leading');
          },
          child: Text('Leading', style: TextStyle(fontWeight: FontWeight.w900)),
        ),
      ),

      body: Center(child: Text('Main', style: TextStyle(fontSize: 36),)),

      // 화면 위에 떠 있는 동작 버튼
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // 버튼 중앙 위치
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      // 애니메이션 사용 X
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('click');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SecondLecture()), (route) => false);
        },
        shape: CircleBorder(),
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.ads_click, color: Colors.white),
      ),
    );
  }
}
