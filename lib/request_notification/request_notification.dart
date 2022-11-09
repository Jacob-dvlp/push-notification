class RequestNotification {
  final String? title;
  final String? body;
  final String? token;
  RequestNotification(
      {required this.title, required this.body, required this.token});

  Map<String, dynamic> toMap() {
    return {
      'notification': <String, dynamic>{
        "title": title,
        "body": body,
      },
      'priority': 'high',
      'data': <String, dynamic>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'id': '1',
        'status': 'done'
      },
      "registration_ids": [token]
    };
  }
}
