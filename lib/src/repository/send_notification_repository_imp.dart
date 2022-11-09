import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:push_notification/constants/url_api.dart';
import 'package:push_notification/request_notification/request_notification.dart';
import 'package:push_notification/utils/api_util/api_uitl.dart';

class SendNotificationRepositoryImp {
  Future sendNotification(
    RequestNotification requestNotification,
  ) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(requestNotification.toMap()), headers: header);
      if (response.statusCode == 200) {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
