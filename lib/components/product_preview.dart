import 'package:flutter/material.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 300, left: 50),
                child: _Shadow(),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/product.png",
                  width: 300,
                )
                // Icon(
                //   Icons.account_balance_sharp,
                //   size: 300,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.1,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(128), blurRadius: 40)
            ]),
      ),
    );
  }
}
