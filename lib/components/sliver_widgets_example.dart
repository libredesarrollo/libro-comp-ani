import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverWidgetsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.purple,
        //   title: Text('AppBar'),
        // ),
        SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 50,
                maxHeight: 200,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.purple,
                  child: const Text("AppBar"),
                ))),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(50, (int index) => _Item()),
          ),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset.toString());
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return true;
  }
}

//ANIMATE
class SliverWidgetsAnimateExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.purple,
        //   title: Text('AppBar'),
        // ),
        SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: _SliverCustomHeaderAnimateDelegate(
              minHeight: 50,
              maxHeight: 200,
            )),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(50, (int index) => _Item()),
          ),
        )
      ],
    );
  }
}

class _SliverCustomHeaderAnimateDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  _SliverCustomHeaderAnimateDelegate(
      {required this.minHeight, required this.maxHeight});
  // @override
  // Widget build(
  //     BuildContext context, double shrinkOffset, bool overlapsContent) {
  //   return SizedBox.expand(
  //       child: AnimatedContainer(
  //     duration: const Duration(milliseconds: 250),
  //     alignment: overlapsContent ? Alignment.bottomLeft : Alignment.center,
  //     color: overlapsContent ? Colors.purple : Colors.red,
  //     child: AnimatedDefaultTextStyle(
  //       style: TextStyle(fontSize: shrinkOffset == 0 ? 50 : 25),
  //       duration: const Duration(milliseconds: 200),
  //       child: const Text(
  //         "AppBar",
  //       ),
  //     ),
  //   ));
  // }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            color: overlapsContent ? Colors.purple : Colors.red,
            child: Stack(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: shrinkOffset == 0 ? 1 : 0,
                  child: Image.asset(
                    "assets/nature.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  top: shrinkOffset == 0 ? 120 : 10,
                  left: shrinkOffset == 0 ? 50 : 100,
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        fontSize: shrinkOffset == 0 ? 50 : 25,
                        color: shrinkOffset == 0 ? Colors.white : Colors.black),
                    duration: const Duration(milliseconds: 200),
                    child: const Text(
                      "AppBar",
                    ),
                  ),
                ),
              ],
            )));
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return true;
  }
}
//ANIMATE

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.purpleAccent,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Example text',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
//Whatsapp

class WhatsAppAppbar extends StatelessWidget {
  const WhatsAppAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: SafeArea(
          child: Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  const SliverAppBar(
                    title: Text(
                      "Whatsapp",
                      style: TextStyle(color: Colors.white),
                    ),
                    centerTitle: false,
                    backgroundColor: Color.fromARGB(255, 47, 55, 51),
                    actions: [
                      Icon(Icons.search, size: 30, color: Colors.white),
                      SizedBox(width: 10),
                      Icon(Icons.more_vert, size: 30, color: Colors.white),
                    ],
                    elevation: 0.0,
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: WhatsappTabs(50.0),
                  ),
                ];
              },
              body: TabBarView(
                children: tabs.map(
                  (String name) {
                    return const CustomScrollView(
                      slivers: [
                        Messages(),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WhatsappTabs extends SliverPersistentHeaderDelegate {
  final double size;

  WhatsappTabs(this.size);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromARGB(255, 4, 94, 84),
      height: size,
      child: const TabBar(
        indicatorWeight: 3,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        // isScrollable: true,
        tabs: <Widget>[
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(text: "Chats"),
          Tab(text: "Status"),
          Tab(text: "Calls"),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(WhatsappTabs oldDelegate) {
    return true;
  }
}

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgzwHNJhsADqquO7m7NFcXLbZdFZ2gM73x8I82vhyhg&s"),
            ),
            title: Text("Mr. H"),
            subtitle: Text("Hey there, look at the appbar"),
          );
        },
      ),
    );
  }
}
