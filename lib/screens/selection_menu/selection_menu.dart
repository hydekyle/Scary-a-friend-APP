import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/selection_menu/components/appbar.dart';
import 'package:flutter_application_1/screens/selection_menu/components/body.dart';

class SelectionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
