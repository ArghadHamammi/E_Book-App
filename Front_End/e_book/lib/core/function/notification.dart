import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

premmission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // ignore: unused_local_variable
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
fcm() {
  FirebaseMessaging.onMessage.listen((remotemessage) {
    print("ddddddddddddddddddddddd");
    print(remotemessage.notification!.body);
    print(remotemessage.notification!.title);
FlutterRingtonePlayer().playNotification();

    Get.snackbar(
        remotemessage.notification!.title!, remotemessage.notification!.body!);
  });
}
