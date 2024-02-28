import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:testcompani/components/menu_bar.dart' as mb;

class ListMenuBar extends StatelessWidget {
  const ListMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<mb.MenuItem> items = [
      mb.MenuItem(
          icon: Icons.access_alarm,
          onPressed: () {
            print('Alarm');
          }),
      mb.MenuItem(
          icon: Icons.notifications,
          onPressed: () {
            print('Icon notifications');
          }),
      mb.MenuItem(
          icon: Icons.subway,
          onPressed: () {
            print('Subway');
          }),
    ];

    final show = Provider.of<mb.MenuBarModel>(context).show;

    return Stack(
      children: [
        const _ListExample(),
        Positioned(
            bottom: 20,
            left: 20,
            child: mb.MenuBar(
              items: items,
              show: show,
            ))
      ],
    );
  }
}

class _ListExample extends StatefulWidget {
  const _ListExample({super.key});

  @override
  State<_ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<_ListExample> {
  ScrollController controller = ScrollController();

  double scrollAfter = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAfter) {
        Provider.of<mb.MenuBarModel>(context, listen: false).show = false;
      } else {
        Provider.of<mb.MenuBarModel>(context, listen: false).show = true;
      }

      scrollAfter = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: 100,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(10),
        color: Colors.purpleAccent,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Example text',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
