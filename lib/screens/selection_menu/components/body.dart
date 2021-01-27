import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Expanded(
              child: Image.asset("assets/images/background_forest.jpg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height)),
        ),
        Image.asset("assets/images/bag_1.png")
      ],
    );
  }
}
