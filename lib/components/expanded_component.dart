import 'package:flutter/material.dart';

class ExpandedComponent extends StatefulWidget {
  const ExpandedComponent({super.key});

  @override
  State<ExpandedComponent> createState() => _ExpandedComponentState();
}

class _ExpandedComponentState extends State<ExpandedComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 400,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              child: Row(children: const [
                Icon(Icons.abc_sharp),
                Icon(Icons.access_time_filled_rounded),
                Icon(Icons.access_alarm),
              ]),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              child: Column(
                children: [
                  Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/330px-Image_created_with_a_mobile_phone.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
