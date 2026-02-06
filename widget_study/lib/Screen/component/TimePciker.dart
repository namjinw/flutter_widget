import 'package:flutter/material.dart';

class Tiempciker extends StatefulWidget {
  const Tiempciker({super.key});

  @override
  State<Tiempciker> createState() => _TiempcikerState();
}

class _TiempcikerState extends State<Tiempciker> {
  final FixedExtentScrollController staticController =
      FixedExtentScrollController();
  final FixedExtentScrollController loopController =
      FixedExtentScrollController();

  int Selected = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: 300,
        height: 300,
        child: Row(
          children: [NomalListScroll(), StaticListScroll(), LoopListScroll()],
        ),
      ),
    );
  }

  Widget NomalListScroll() => Expanded(
    child: ListWheelScrollView(
      // 평범한 ListWheelScroll
      // 휠 스크롤 뷰(위젯)
      itemExtent: 30.0,
      // 요소 높이
      // diameterRatio: 3.0, // 리스트 휠의 곡률
      // offAxisFraction: 0.3, // 의 중심축에서 약간 옆으로 이동시키고 싶을 때
      useMagnifier: true,
      // 중앙 항목 확대 효과를 사용할지 여부를 결정 => 반드시 true로 해야 magnification 적용됨
      magnification: 1.2,
      // 휠 중심 내용 강조
      // perspective: 0.003, // 원근감
      children: [
        ...List.generate(
          10,
          (index) => Text('index: $index', style: TextStyle(fontSize: 20)),
        ),
      ],
    ),
  );

  Widget StaticListScroll() => Expanded(
    child: ListWheelScrollView.useDelegate(
      // 자식한테 아이템 만드는 거 위임
      itemExtent: 40,
      // 아이템 높이
      physics: FixedExtentScrollPhysics(),
      // 스크롤 물리적 특성 지정, 스크롤이 아이템 단위로 정지하도록 함
      childDelegate: ListWheelChildListDelegate(
        // 끝이 있는 리스트
        children: [
          Text(
            'AM',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'PM',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    ),
  );

  Widget LoopListScroll() => Expanded(
    child: Stack(
      children: [
        ListWheelScrollView.useDelegate(
          controller: loopController,
          itemExtent: 40,
          // 아이템 높이
          useMagnifier: true,
          onSelectedItemChanged: (value) {
            Selected = value;
            setState(() {});
          },
          magnification: 1.2,
          physics: FixedExtentScrollPhysics(),
          // 스크롤 물리적 특성 지정, 스크롤이 아이템 단위로 정지하도록 함
          childDelegate: ListWheelChildLoopingListDelegate(
            // 끝이 있는 리스트
            children: List.generate(
              5,
              (index) => Text(
                index.toString(),
                style: TextStyle(
                  fontSize: 32,
                  color: Selected == index ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
        Center(child: overlay()),
      ],
    ),
  );

  Widget overlay() => IgnorePointer(
    ignoring: true,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.black, width: 3),
        ),
      ),
    ),
  );
}
