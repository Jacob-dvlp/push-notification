import 'package:flutter/material.dart';
import 'package:push_notification/constants/url_api.dart';
import 'package:push_notification/presetation/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Stack(
          children: [
            Positioned(
                bottom: 50,
                left: 10,
                right: 10,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.orange,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  background,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ));
  }
}
