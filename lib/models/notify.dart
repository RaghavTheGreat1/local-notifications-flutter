import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

class Notify {
  static Future<bool> instantNotify() async {
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    return awesomeNotifications.createNotification(
      content: NotificationContent(
        id: Random().nextInt(100),
        title: "Instant Delivery",
        body: "Notification that delivers instantly on trigger.",
        channelKey: 'instant_notification',
      ),
    );
  }
}
