import 'dart:math';

import 'package:flutter/material.dart';

class DemoRadialProgress extends StatefulWidget {
  const DemoRadialProgress({super.key});

  @override
  State<DemoRadialProgress> createState() => _DemoRadialProgressState();
}

class _DemoRadialProgressState extends State<DemoRadialProgress> {
  double add = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RadialProgress(percentage: 10 * add, color: Colors.pink),
        RadialProgress(percentage: 40 * add, color: Colors.purple),
        TextButton(
            onPressed: () {
              add += .1;
              setState(() {});
            },
            child: const Text('Click')),
      ],
    );
  }
}

class RadialProgress extends StatelessWidget {
  final Color color;

  const RadialProgress({required this.percentage, required this.color});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: _RadialProgress(
            percentage: percentage,
            primaryColor: color,
            secondaryColor: Colors.grey,
            primaryThickness: 10,
            secondaryThickness: 4,
          ),

          // child: Text('$percentage %', style: TextStyle(fontSize: 50.0) ),
        ),
      ],
    );
  }
}

class _RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryThickness;
  final double primaryThickness;

  const _RadialProgress(
      {required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryThickness = 10,
      this.secondaryThickness = 4});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<_RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double oldPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);

    final oldDifference = widget.percentage - oldPercentage;
    oldPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgressCustomPainter(
                (widget.percentage - oldDifference) +
                    (oldDifference * animationController.value),
                widget.primaryColor,
                widget.secondaryColor,
                widget.primaryThickness,
                widget.secondaryThickness),
          ),
        );
      },
    );
  }
}

class _MiRadialProgressCustomPainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryThickness;
  final double secondaryThickness;

  _MiRadialProgressCustomPainter(this.percentage, this.primaryColor,
      this.secondaryColor, this.primaryThickness, this.secondaryThickness);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = secondaryThickness
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    // Circle
    canvas.drawCircle(center, radio, paint);

    // Arc
    final paintArco = Paint()
      ..strokeWidth = primaryThickness
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
