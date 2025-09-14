import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static AndroidNotificationChannel get channel =>
      const AndroidNotificationChannel(
        'com.ciaogg.app',
        'ciaogg_app',
        description: 'ciaogg_app_description',
        playSound: true,
        enableVibration: true,
        importance: Importance.max,
        showBadge: true,
        enableLights: true,
      );

  static AndroidNotificationDetails get androidNotificationDetails =>
      AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        icon: 'launch_background',
        playSound: channel.playSound,
        channelShowBadge: true,
        enableVibration: channel.enableVibration,
        importance: channel.importance,
        priority: Priority.high,
        enableLights: channel.enableVibration,
      );

  static DarwinNotificationDetails get iosNotificationDetails =>
      const DarwinNotificationDetails(
        presentBadge: true,
        presentSound: true,
        presentAlert: true,
      );

  static void showNotification(
    LocalNotificationModel notification, {
    void Function(dynamic)? onClick,
  }) async {
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      "notification_icon",
    );

    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
        if (onClick != null) onClick(payload);
      },
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    try {
      await FlutterLocalNotificationsPlugin().show(
        notification.id,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: json.encode(notification.toJson()),
      );
    } catch (_) {}
  }

  static Future createNotificationChannel() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(LocalNotificationService.channel);
  }
}

class LocalNotificationModel {
  int id;
  String title;
  String? body;

  LocalNotificationModel({required this.id, required this.title, this.body});

  factory LocalNotificationModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'] ?? 0;
    String title = json['title'] ?? "";
    String body = json['body'] ?? "";

    return LocalNotificationModel(id: id, title: title, body: body);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
