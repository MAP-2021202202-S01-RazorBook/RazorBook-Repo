import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    var initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onSelectNotification: (payload) {
        /// Do something when user select notification
      },
    );
  }

  showNotification(
      {required String title, required String body, required payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '1122334455',
      'razor_book_notification',
      channelDescription: 'Razor Book Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    var ios = const IOSNotificationDetails();
    var platform =
        NotificationDetails(android: androidPlatformChannelSpecifics, iOS: ios);

    await flutterLocalNotificationsPlugin.show(
      payload.hashCode,
      title,
      body,
      platform,
      payload: payload.toString(),
    );
  }
}
