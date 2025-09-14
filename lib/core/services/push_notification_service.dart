// import 'dart:async';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:yummy_bites/core/services/local_cache_service/local_cache_service.dart';
// import 'package:yummy_bites/core/services/local_notification_service.dart';
// import 'package:yummy_bites/routes/navigation_helper.dart';
// import '../logger/logger_service.dart';
// import 'package:firebase_app_installations/firebase_app_installations.dart';

// class PushNotificationService {
//   FirebaseMessaging get _messaging => FirebaseMessaging.instance;
//   final Log _log = Log(PushNotificationService);

//   final StreamController<PushNotificationModel> _controller =
//       StreamController.broadcast();

//   Stream<PushNotificationModel> get stream => _controller.stream;

//   Future<void> subscribeToTopics(List<String>? topics) async {
//     List<String>? previusTopics =
//         await LocalCacheService.retrieveNotificationTopics();

//     Set<String> newTopics = {
//       ...topics?.toSet() ?? {},
//       ...previusTopics?.toSet() ?? {},
//     };

//     topics = newTopics.toList();

//     LocalCacheService.storeNotificationTopics(topics);

//     if (topics.isNotEmpty) {
//       await Future.wait(
//         topics.map((topic) async {
//           _messaging.subscribeToTopic(topic);
//           _log.d("Subscribed to $topic");
//         }).toList(),
//       );
//     }
//   }

//   bool _initialized = false;

//   Future initialize([List<String>? topics]) async {
//     if (_initialized) return;

//     _log.d("initialize");

//     await LocalNotificationService.createNotificationChannel();

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );

//     final token = await _messaging.getToken();
//     _log.d("Token $token");

//     await subscribeToTopics(topics);

//     _initialized = true;

//     // TODO place to navigate to the pages
//     // TODO if app started by clicking notification from terminated state
//     _messaging.getInitialMessage().then((RemoteMessage? value) {
//       if (value != null) {
//         _onAppOpen(value);
//         _controller.add(value.toModel);
//       }
//     });

//     // TODO place to navigate to the pages
//     // TODO if app started by clicking notification from background state
//     FirebaseMessaging.onMessageOpenedApp.listen(_onAppOpen);

//     // For FCM token
//     // _messaging.getToken().then((value) => print("FCM TOKEN $value"));

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       _controller.add(message.toModel);

//       _log.d(notification?.title, tag: "onMessage");

//       if (Platform.isAndroid && notification != null) {
//         LocalNotificationService.showNotification(
//           LocalNotificationModel(
//             id: message.messageId.hashCode,
//             body: notification.body,
//             title: notification.title ?? "",
//           ),
//           onClick: (dynamic payload) {
//             _onAppOpen(message);
//           },
//         );
//       }
//     });

//     // FirebaseMessaging.onBackgroundMessage(
//     //   (RemoteMessage message) async {
//     //     RemoteNotification? notification = message.notification;
//     //
//     //     if (notification != null) {
//     //       LocalNotificationService.showNotification(
//     //         LocalNotificationModel(
//     //           id: DateTime.now().millisecondsSinceEpoch,
//     //           title: notification.title ?? "",
//     //           body: notification.body,
//     //         ),
//     //         onClick: (dynamic payload) {
//     //           _onAppOpen(message);
//     //         },
//     //       );
//     //     }
//     //   },
//     // );

//     return;
//   }

//   // _onAppOpen(RemoteMessage message) {
//   //   // print(message.data);
//   //   // RouterHelper().navigateToNotificationsView();
//   //   serializeAndNavigate();
//   // }

//   serializeAndNavigate() {
//     // RouterHelper().navigateToNotificationsView();
//   }

//   Future<void> logout() async {
//     try {
//       List<String>? topics =
//           await LocalCacheService.retrieveNotificationTopics();
//       print(topics);
//       await FirebaseInstallations.instance.delete();
//       print('Firebase Installation ID (FID) deleted.');

//       // if (topics != null && topics.isNotEmpty) {
//       //   await Future.wait(
//       //     topics.map(
//       //       (topic) async {
//       //         await _messaging.unsubscribeFromTopic(topic);
//       //         _log.d(
//       //           "UnSubscribed to $topic",
//       //         );
//       //       },
//       //     ).toList(),
//       //   );
//       // }
//       // await LocalCacheService.clearNotificationTopics();

//       await _messaging.deleteToken();
//       _log.d('logout from pushNotifications');
//       _initialized = false;
//     } catch (e) {
//       _log.e(e, tag: 'logout');
//     }
//   }
// }

// class PushNotificationModel {}

// extension on RemoteMessage {
//   PushNotificationModel get toModel {
//     return PushNotificationModel();
//   }
// }
