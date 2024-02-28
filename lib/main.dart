import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcompani/components/animation_controller_example.dart';
import 'package:testcompani/components/button_animated.dart';
import 'package:testcompani/components/button_load.dart';
import 'package:testcompani/components/button_slide.dart';
import 'package:testcompani/components/custom_grid.dart';
import 'package:testcompani/components/drawer.dart';
import 'package:testcompani/components/expanded_component.dart';
import 'package:testcompani/components/list_menu_bar.dart';
import 'package:testcompani/components/product_preview.dart';
import 'package:testcompani/components/progress_bar.dart';
import 'package:testcompani/components/select_wheel.dart';
import 'package:testcompani/components/menu_bar.dart' as mb;

void main() => runApp(ChangeNotifierProvider(
      // create: (_) => new LayoutModel(),
      create: (_) => mb.MenuBarModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: Scaffold(appBar: AppBar(), body: ButtonLoad()),
      home: Scaffold(
        appBar: AppBar(),
        // body: CustomGrid(),
        // body: mb.MenuBar(items: items),
        body: ListMenuBar(),
        drawer: MyDrawer(),
      ),
    );
  }
}
