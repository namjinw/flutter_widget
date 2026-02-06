import 'dart:convert';

import 'package:download/Model/alarm.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller {
  static List<Alarm> alarmList = [];
  static List<String> weekDay = [];

  static Future<void> initPrefs() async {
    final prefs = await SharedPreferences.getInstance(); // 앱 저장소 가져오기

    await LoadWeekDayData();
    await LoadAlarmData(prefs);
  }

  static Future<void> LoadWeekDayData() async {
    final String jsonFile = await rootBundle.loadString(
      'assets/weekday.json'
    );
    // print('json: ' + jsonFile);
    final List Decodejson = jsonDecode(jsonFile);
    print(Decodejson);

    for (var i in Decodejson) {
      final String day = i['week'];
      weekDay.add(day);
      print('add week $day');
    }
    print('end Binding Data! $weekDay');
  }

  static Future<void> LoadAlarmData(SharedPreferences prefs) async {
    alarmList.clear();
    final List<String>? data = prefs.getStringList('alarm_List');
    if (data == null) {
      defaultValue();
    } else {
    }
  }

  static Future<void> defaultValue() async {
      final String jsonFile = await rootBundle.loadString(
        'assets/Alarm.json'
      );

      final List<dynamic> json = jsonDecode(jsonFile);
      final List<Alarm> alarms = json.map((e) => Alarm.fromJson(e)).toList();
      alarmList.addAll(alarms);
      print(alarmList);
  }

  static Future<void> SaveAlarmData(SharedPreferences prefs) async {
  }
}