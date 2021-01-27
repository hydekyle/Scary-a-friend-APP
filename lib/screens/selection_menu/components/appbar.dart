import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_1/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg"),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          // By default our  icon color is white
          color: kIconColor,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.star),
        color: Colors.orange[700],
        onPressed: () {},
      ),
      SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
