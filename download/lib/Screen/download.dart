import 'package:download/Controller/alarmController.dart';
import 'package:download/Screen/component/capture_alarm.dart';
import 'package:flutter/material.dart';

class Download_Screen extends StatefulWidget {
  const Download_Screen({super.key});

  @override
  State<Download_Screen> createState() => _Download_ScreenState();
}

class _Download_ScreenState extends State<Download_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,colors: [Colors.purpleAccent, Colors.deepPurple])
      ),
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyFliadActionButton(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CaptureAlarmimage(alarm: Controller.alarmList[index],);
          },
          itemCount: Controller.alarmList.length,
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            print('back');
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
        ),
        Text(
          'Alarms',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ],
    ),
  );

  Widget MyFliadActionButton() => Container(
    width: 70,
    height: 70,
    child: FloatingActionButton(
      onPressed: () {
        print('go to add page');
      },
      shape: CircleBorder(),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, color: Colors.purple, size: 30),
          Text(
            'Add new',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    ),
  );
}
