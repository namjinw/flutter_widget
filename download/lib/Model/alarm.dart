import 'package:flutter/material.dart';

class Alarm {
  final int id;
  final String alarmName;
  final DateTime alarmTime;
  final bool checkUse;
  final List<String> when_weekday;
  final Color boxColor;

  Alarm({
    required this.id,
    required this.alarmName,
    required this.alarmTime,
    required this.checkUse,
    required this.when_weekday,
    required this.boxColor,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      id: json['id'],
      alarmName: json['alarmName'],
      alarmTime: DateTime.fromMillisecondsSinceEpoch(json['alarmTime']),
      // 밀리초 단위로 표현된 숫자(int)를 DateTime 객체로 변환
      checkUse: json['checkUse'],
      when_weekday: List<String>.from(json['when_weekday']), // 데이터 타입 확인 후 저장
      boxColor: Color(json['boxColor']), // json 숫자를 Color로 변환
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alarmName': alarmName,
      'alarmTime': alarmTime.millisecondsSinceEpoch, // DateTime 객체를 **밀리초 정수(int)**로 변환
      'checkUse': checkUse,
      'when_weekday': when_weekday,
      'boxColor': boxColor.toARGB32(), // 색깔 변환 int(정수)로 변환
    };
  }
}
