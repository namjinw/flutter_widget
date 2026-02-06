import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_study/Screen/component/TimePciker.dart';

class My_Theme extends StatefulWidget {
  const My_Theme({super.key});

  @override
  State<My_Theme> createState() => My_ThemeState();
}

class My_ThemeState extends State<My_Theme> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Text Colors'),
                MyButton(() {
                  showDialog(
                    context: context,
                    builder: (context) => Tiempciker(),
                  );
                }, 'Button'),
                MyButton(() {
                  showDialog(
                    context: context,
                    builder: (context) => Alert(context),
                  );
                }, 'AlertDialog'),
                MyButton(() {
                  showDialog(
                    context: context,
                    builder: (context) => Simple(context),
                  );
                }, 'Simple'),
                Container(width: 100, height: 100, child: TextField()),
                Checkbox(value: true, onChanged: (value) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget MyButton(VoidCallback onTaps, String text) =>
      ElevatedButton(onPressed: onTaps, child: Text(text));

  Widget Alert(BuildContext acontext) => AlertDialog(
    title: Text('Alert 다이얼로그 입니다.'),
    content: Text('dialog'),
    actions: [
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(acontext),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Center(child: Text('Cancel')),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  Widget Simple(BuildContext acontext) => SimpleDialog(
    title: Text('Simple'),
    children: [
      SimpleDialogOption(
        child: Text('Option1'),
        onPressed: () {
          Navigator.of(acontext).pop();
        },
      ),
      SimpleDialogOption(
        child: Text('Option1'),
        onPressed: () {
          Navigator.of(acontext).pop();
        },
      ),
      SimpleDialogOption(
        child: Text('Option1'),
        onPressed: () {
          Navigator.of(acontext).pop();
        },
      ),
      SimpleDialogOption(
        child: Text('Option1'),
        onPressed: () {
          Navigator.of(acontext).pop();
        },
      ),
    ],
  );
}
