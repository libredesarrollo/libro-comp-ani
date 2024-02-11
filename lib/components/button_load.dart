import 'package:flutter/material.dart';

class ButtonLoad extends StatefulWidget {
  ButtonLoad({Key? key}) : super(key: key);

  @override
  State<ButtonLoad> createState() => _ButtonLoadState();
}

class _ButtonLoadState extends State<ButtonLoad> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //     alignment: Alignment.center,
    //     padding: EdgeInsets.all(32),
    //     child: ElevatedButton(onPressed: () {}, child: Text('Social')));
    return Center(
      child: ButtonTheme(
        minWidth: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
              foregroundColor: Colors.white,
              shadowColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {
            setState(() {
              _isLoading = !_isLoading;
            });
          },
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Social'),
        ),
      ),
    );
  }
}
