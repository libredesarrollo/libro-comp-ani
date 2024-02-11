import 'package:flutter/material.dart';

class ButtonSlide extends StatefulWidget {
  ButtonSlide({Key? key}) : super(key: key);

  @override
  State<ButtonSlide> createState() => _ButtonSlideState();
}

class _ButtonSlideState extends State<ButtonSlide> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        width: 300,
        height: 300,
        child: Stack(
          children: [
            AnimatedPositioned(
                top: _expanded ? 0 : 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    width: 200, height: 50, color: Colors.red)), // hide show
            Positioned(
                top: 50,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                    child:
                        Container(width: 200, height: 50, color: Colors.black)))
          ],
        ),
      ),
    );
  }
}
