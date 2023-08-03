import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class FirstTaskHandler extends TaskHandler {
  int updateCount = 0;
  int counter = 0;

  void startCameraStream() {}

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    NotificationListenerService.notificationsStream.listen((event) {
      log("Current notification: $event");
      log(event.hasExtrasPicture.toString());
    });
  }

  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {}

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    await FlutterForegroundTask.clearAllData();
  }

  void onButtonPressed(String id) {
    log('onButtonPressed >> $id -- $updateCount');
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {}
}
