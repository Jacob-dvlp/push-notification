import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomPushNotification  {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  CustomPushNotification() {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    configuraAndroid().then(
      (value) {
        flutterLocalNotificationsPlugin = value;
        inicializeNotifications();
      },
    );
  }
  
  Future<FlutterLocalNotificationsPlugin> configuraAndroid() async {
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    return flutterLocalNotificationsPlugin;
  }


  inicializeNotifications() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
    );
  }

  
  androidNotification(RemoteNotification notification,
      AndroidNotification androidNotification) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: androidNotification.smallIcon,
        ),
      ),
    );
  }
}
