import 'package:flutter/material.dart';

import 'presetation/splash_screen/splash_page.dart';

class MyAppPushNotification extends StatelessWidget {
  const MyAppPushNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
