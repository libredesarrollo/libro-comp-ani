import 'package:flutter/material.dart';

class SelectWheel extends StatelessWidget {
  final _list = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
    'item 7',
    'item 8',
  ];

  SelectWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
          physics: BouncingScrollPhysics(),
          itemExtent: 30,
          diameterRatio: 1,
          children: _list
              .map((linea) => Text(linea,
                  style: TextStyle(
                      fontSize: 25, color: Colors.black.withOpacity(0.8))))
              .toList()),
    );
  }
}
