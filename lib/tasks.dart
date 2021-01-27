import 'package:fluttertoast/fluttertoast.dart';
import 'package:workmanager/workmanager.dart';

const myTask = "scream1";

void initializeTasks() {
  // initialize Workmanager with the function which you want to invoke after any periodic time
  Workmanager.initialize(callbackDispatcher);
  // Periodic task registration
  Workmanager.registerOneOffTask(
      "ScreamTask",
      // use the same task name used in callbackDispatcher function for identifying the task
      // Each task must have an unique name if you want to add multiple tasks;
      myTask,
      // When no frequency is provided the default 15 minutes is set.
      // Minimum frequency is 15 min.
      // Android will automatically change your frequency to 15 min if you have configured a lower frequency than 15 minutes.
      initialDelay: Duration(seconds: 5),
      existingWorkPolicy: ExistingWorkPolicy.replace);
}

void callbackDispatcher() {
// this method will be called every hour
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

    //Return true when the task executed successfully or not
    return Future.value(true);
  });
}
