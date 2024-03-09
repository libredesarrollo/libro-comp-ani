import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), Grid()],
      ),
    );
  }
}

class Background extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.7],
          colors: [Colors.purple, Colors.deepPurple]));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(decoration: boxDecoration),
        Positioned(top: -100, left: -30, child: _BoxBgDecoration(200, 200)),
        Positioned(
            top: size.width * .3,
            left: size.height * .5,
            child: _BoxBgDecoration(50, 50)),
        Positioned(
            top: size.width * .7,
            left: size.height * .6,
            child: _BoxBgDecoration(50, 50)),
        Positioned(
            top: size.width * .5,
            left: size.height * .4,
            child: _BoxBgDecoration(50, 50)),
        Positioned(
            top: size.width * .8,
            left: size.height * .1,
            child: _BoxBgDecoration(50, 50)),
      ],
    );
  }
}

class _BoxBgDecoration extends StatelessWidget {
  final double width;
  final double height;
  _BoxBgDecoration(this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent])),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 40,
      mainAxisSpacing: 40,
      crossAxisCount: 2,
      children: const <Widget>[
        _Card(color: Colors.red, icon: Icons.abc_outlined, text: 'ABC'),
        _Card(color: Colors.purple, icon: Icons.access_alarm, text: 'Alarm'),
        _Card(color: Colors.amber, icon: Icons.bolt, text: 'Bolt'),
        _Card(
            color: Colors.green,
            icon: Icons.emoji_transportation,
            text: 'Transportation'),
        _Card(color: Colors.lightBlue, icon: Icons.ac_unit, text: 'Unit'),
        _Card(color: Colors.red, icon: Icons.abc_outlined, text: 'ABC'),
        _Card(color: Colors.purple, icon: Icons.access_alarm, text: 'Alarm'),
        _Card(color: Colors.amber, icon: Icons.bolt, text: 'Bolt'),
        _Card(
            color: Colors.green,
            icon: Icons.emoji_transportation,
            text: 'Transportation'),
        _Card(color: Colors.lightBlue, icon: Icons.ac_unit, text: 'Unit'),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _Card(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: color),
              child: Icon(
                icon,
                size: 120,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 25),
        )
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              // color: Colors.black87.withAlpha(120),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.5,
                    0.8
                  ],
                  colors: [
                    Colors.black87.withAlpha(120),
                    Colors.black45.withAlpha(180)
                  ]),
              borderRadius: BorderRadius.circular(20)),
          child: child,
        ),
      ),
    );
  }
}
