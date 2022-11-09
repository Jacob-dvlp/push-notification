import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/src/firebase/custom_push_notification/custom_push_notification_imp.dart';

class ServiceCustomNotification {
  final CustomPushNotification _customNotification;
  ServiceCustomNotification._init(this._customNotification) {
    inicializeSerices().whenComplete(() => getTokenDevice());
  }

  static final ServiceCustomNotification _serviceNotification =
      ServiceCustomNotification._init(CustomPushNotification());

  factory ServiceCustomNotification() => _serviceNotification;

  Future inicializeSerices() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(badge: true, sound: true);
    FirebaseMessaging.onMessage.listen(
      (message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          _customNotification.androidNotification(notification, android);
        }
      },
    );
  }

  Future<String> getTokenDevice() async {
    final tokenDevice = await FirebaseMessaging.instance.getToken();
    log(tokenDevice.toString());
    return tokenDevice!;
  }
}
