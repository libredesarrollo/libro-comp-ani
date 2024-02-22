import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final percentage = .5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Text('3:50'),
          const SizedBox(height: 15),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 30,
                  height: 300,
                  color: Colors.purple.withOpacity(0.1),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 30,
                    height: 300 * percentage,
                    color: Colors.purple.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
