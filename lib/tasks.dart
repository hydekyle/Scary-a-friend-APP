import 'package:fluttertoast/fluttertoast.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/services.dart';

const myTask = "scream1";

var _androidAppRetain = MethodChannel("android_app_retain");

void initializeTasks() {
  _androidAppRetain
      .invokeMethod("sendToBackground")
      .then((value) => print(value));
  Workmanager.initialize(callbackDispatcher);

  Workmanager.registerOneOffTask(
    "ScreamTask",
    myTask,
    initialDelay: Duration(seconds: 5),
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );
}

void callbackDispatcher() {
  Workmanager.executeTask((task, inputdata) async {
    switch (task) {
      case myTask:
        print("this method was called from native! ");
        Fluttertoast.showToast(msg: "this method was called from native!");
        break;

      case Workmanager.iOSBackgroundTask:
        print("iOS background fetch delegate ran");
        break;
    }

    return Future.value(true);
  });
}
