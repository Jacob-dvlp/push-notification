import 'package:flutter/material.dart';
import 'package:push_notification/constants/url_api.dart';
import 'package:push_notification/request_notification/request_notification.dart';
import 'package:push_notification/src/repository/send_notification_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = TextEditingController();
  final body = TextEditingController();
  final token = TextEditingController(text: tokenDevice);
  bool isSend = false;

  Future send() async {
    final data = RequestNotification(
        title: title.text, body: body.text, token: token.text);
    if (title.text.isEmpty && body.text.isEmpty && token.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('empty fields are not allowed')));
    } else if (title.text.isEmpty || body.text.isEmpty || token.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('empty fields are not allowed')));
    } else {
      isSendNotification(true);
      await SendNotificationRepositoryImp().sendNotification(data);
      isSendNotification(false);
    }
  }

  isSendNotification(bool value) {
    setState(() {
      isSend = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Send Notification From Device'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    labelText: 'Title Notification',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: body,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    labelText: 'Body Notification',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: token,
                  decoration: const InputDecoration(
                    labelText: 'Token Device',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
              isSend
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                      color: Colors.white,
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: send,
                      child: const Text('Send Notification'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
