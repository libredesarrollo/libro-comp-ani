import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItem {
  final Function onPressed;
  final IconData icon;

  MenuItem({required this.onPressed, required this.icon});
}

class _MenuItems extends StatelessWidget {
  final List<MenuItem> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _MenuItemButton(i, menuItems[i])));
  }
}

class _MenuItemButton extends StatelessWidget {
  final int index;
  final MenuItem item;

  const _MenuItemButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<MenuBarModel>(context).itemSelected; // xxx

    final menuModel = Provider.of<MenuBarModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<MenuBarModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelected == index) ? 30 : 20,
          color: (itemSelected == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuBarBackground extends StatelessWidget {
  final Widget widget;

  const _MenuBarBackground({required this.widget});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<MenuBarModel>(context).backgroundColor;

    return Container(
      child: widget,
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10)
          ]),
    );
  }
}

class MenuBar extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor; // black
  final Color inactiveColor;

  final List<MenuItem> items;

  const MenuBar(
      {this.show = true,
      this.backgroundColor = Colors.purple,
      this.activeColor = Colors.deepOrange,
      this.inactiveColor = Colors.white,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: (show) ? 1 : 0,
      child: Builder(
        builder: (BuildContext context) {
          return _MenuBarBackground(
            widget: _MenuItems(items),
          );
        },
      ),
    );
  }
}

class MenuBarModel with ChangeNotifier {
  int _itemSelected = 0;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelected => _itemSelected;

  set itemSelected(int index) {
    _itemSelected = index;
    notifyListeners();
  }

  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
