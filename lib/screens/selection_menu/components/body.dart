import 'package:flutter/material.dart';
import 'package:flutter_application_1/tasks.dart';
import 'package:minimize_app/minimize_app.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background_forest.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Center(
          child: RaisedButton(
            onPressed: () => {(onButtonPressed())},
            child: Text("Enter"),
            splashColor: Colors.pink[600],
          ),
        )
      ],
    );
  }
}

void onButtonPressed() {
  initializeTasks();
  MinimizeApp.minimizeApp();
}
