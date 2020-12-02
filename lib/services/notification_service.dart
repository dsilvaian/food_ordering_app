import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin _notifP;

  NotificationService() {
    _initNotif();
  }

  _initNotif() async {
    // Instantiate Plugin
    _notifP = FlutterLocalNotificationsPlugin();

    // Initialize Android Settings
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings("app");

    final InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    // Initialize Plugin
    await _notifP.initialize(
      initSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      print(payload);
    }
  }

  Future sendNotification(
    String title,
    String text,
    String notifData,
  ) async {
    const AndroidNotificationDetails androidNotifDetails =
        AndroidNotificationDetails(
      "0",
      "Punk Food",
      "Food Ordering App",
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notifDetails = NotificationDetails(
      android: androidNotifDetails,
    );

    await _notifP.show(
      0,
      title,
      text,
      notifDetails,
      payload: notifData,
    );
  }
}
