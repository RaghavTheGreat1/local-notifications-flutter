import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

class Notify {
  static Future<bool> instantNotify() async {
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    return await awesomeNotifications.createNotification(
      content: NotificationContent(
        id: Random().nextInt(100),
        title: "Instant Delivery",
        body: "Notification that delivers instantly on trigger.",
        channelKey: 'instant_notification',
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: 'asset://images/moon.jpg',
      ),
    );
  }

  static Future<bool> scheduleNotification() async {
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    return await awesomeNotifications.createNotification(
      schedule: NotificationInterval(interval: 60),
      content: NotificationContent(
        id: Random().nextInt(100),
        title: "Scheduled Notification",
        body:
            "So this notification will get triggered when it's 9 pm on my device and the date is December 9, 2021.",
        channelKey: 'scheduled_notification',
        wakeUpScreen: true,
        autoDismissible: false,
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: 'asset://images/moon.jpg',
        category: NotificationCategory.Reminder,
      ),
    );
  }

  static Future<void> retrieveScheduledNotifications() async {
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    List<NotificationModel> scheduledNotifications =
        await awesomeNotifications.listScheduledNotifications();
    print(scheduledNotifications);
  }
}
