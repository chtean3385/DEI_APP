import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init(BuildContext context) async {
    const androidInit = AndroidInitializationSettings('@drawable/ic_notification',);
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    // 🔔 Register notification channel with sound
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
      const AndroidNotificationChannel(
        'default_channel',
        'General Notifications',
        description: 'Used for chef app order updates',
        importance: Importance.max,
        playSound: true,
      ),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint("🔔 Notification tapped: ${details.payload}");
        // Add optional navigation logic here if needed
        if (details.actionId == 'ACCEPT') {
          debugPrint("✅ Order accepted");
          // TODO: Accept order API
        } else if (details.actionId == 'REJECT') {
          debugPrint("❌ Order rejected");
          // TODO: Reject order API
        }
        else if (details.actionId == 'VIEW DETAILS') {
          debugPrint(" Order Viw Details");
          // TODO: Viw order API
        }
      },
    );

    // Request notification permission
    await FirebaseMessaging.instance.requestPermission( alert: true,
        badge: true,
        sound: true);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint("📥 Foreground FCM message: ${message.toMap()}");

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        // This will show the push in foreground
        await showLocalNotification(
          title: notification.title ?? 'New Order',
          body: notification.body ?? '',
          payload: message.data['orderId'] ?? '',
        );
      }

      // Optional: handle data payload too
      if (message.data.isNotEmpty) {
        await handleStreamMessage(message);
      }
    });

    _registerFirebaseToken();
  }

  /// Show local notification
  /// Show local notification with design
  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {

    final androidDetails = AndroidNotificationDetails(
      'default_channel',
      'General Notifications',
      channelDescription: 'Chef order and system notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,colorized: false,color: Colors.white,
      largeIcon: DrawableResourceAndroidBitmap('@drawable/ic_notification'),
      styleInformation: DefaultStyleInformation(true, true),
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('ACCEPT', 'Accept', showsUserInterface: true,titleColor: Colors.green),
        AndroidNotificationAction('REJECT', 'Reject', showsUserInterface: true,titleColor: Colors.red),
        AndroidNotificationAction('VIEW DETAILS', 'View Details', showsUserInterface: true,titleColor: Colors.black),
      ],
    );

    final notificationDetails = NotificationDetails(android: androidDetails);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }


  /// Handle additional data
  Future<void> handleStreamMessage(RemoteMessage message) async {
    try {
      final data = message.data;
      debugPrint("📦 Custom data: ${data['type']}, order ID: ${data['orderId']}");
      // TODO: Custom logic based on message.data
    } catch (e) {
      debugPrint("❌ Error handling message: $e");
    }
  }

  /// Background handler (call in main.dart)
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    debugPrint("📥 [BG] Background FCM message: ${message.data}");
    final data = message.data;
    final body = data['body'] ?? 'New order arrived!';
    final title = data['title'] ?? 'Chef App';

    await showLocalNotification(title: title, body: body);
  }
  Future<void> _registerFirebaseToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      debugPrint("📲 FCM token registered with Stream: $fcmToken");
      /// api cal to send fcm to backend
    }

  }

}
