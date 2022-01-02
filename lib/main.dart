import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification/models/notify.dart';

void main() {
  runApp(const MyApp());
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'reminders',
        channelKey: 'instant_notification',
        channelName: 'Basic Instant Notification',
        channelDescription:
            'Notification channel that can trigger notification instantly.',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
      NotificationChannel(
        channelGroupKey: 'reminders',
        channelKey: 'scheduled_notification',
        channelName: 'Scheduled Notification',
        channelDescription:
            'Notification channel that can trigger notification based on predefined time.',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  await Notify.instantNotify();
                },
                child: const Text("Instant Notification "),
              ),
              TextButton(
                onPressed: () async {
                  await Notify.scheduleNotification();
                },
                child: const Text("Schedule Notification "),
              ),
              TextButton(
                onPressed: () async {
                  await Notify.retrieveScheduledNotifications();
                },
                child: const Text("Retrieve Scheduled Notifications"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
