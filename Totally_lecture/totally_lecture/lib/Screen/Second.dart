import 'package:flutter/material.dart';

class SecondLecture extends StatefulWidget {
  const SecondLecture({super.key});

  @override
  State<SecondLecture> createState() => _SecondLectureState();
}

class _SecondLectureState extends State<SecondLecture> {
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // StaticListView()
          Expanded(
            // ListView는 기본적으로 높이를 최대한 많이 차지 => 즉 무한하게 차지하기에
            // Expanded로 자기 크기 많큼 남은 공간을 차지하게 해야함
            child: ListView.builder( // 동적으로 생성하는 거로
              // 화면에 만들고 보이는 것만 랜더링 => 안보이는 건 메모리 할당 X
              itemBuilder: (context, index) => Listitem('box${index + 1}', colors[index]),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget StaticListView() => ListView( // 정적 리스트 생성 => 정해진 요소만 생성
    children: [
      Column(
        children: [
          Listitem('box1', Colors.red),
          Listitem('box2', Colors.orange),
          Listitem('box3', Colors.yellow),
          Listitem('box4', Colors.green),
          Listitem('box5', Colors.blue),
        ],
      ),
    ],
  );

  Widget Listitem(String text, Color color) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text),
      Container(height: 100, decoration: BoxDecoration(color: color)),
    ],
  );
}
