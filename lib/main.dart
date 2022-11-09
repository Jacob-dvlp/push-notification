import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/src/firebase/service_notification/service_notification.dart';

import 'my_app_push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ServiceCustomNotification().inicializeSerices();
  await ServiceCustomNotification().getTokenDevice();
  runApp(const MyAppPushNotification());
}
