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
    const androidInit = AndroidInitializationSettings('@drawable/ic_notification');
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
        description: 'Used for important chat messages',
        importance: Importance.max,
        playSound: true,
      ),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint("🔔 Notification tapped: ${details.payload}");
        // Add optional navigation logic here if needed
      },
    );

    // Request notification permission
    await FirebaseMessaging.instance.requestPermission(alert: true,
        badge: true,
        sound: true);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint("📥 Foreground FCM message: ${message.data}");
      debugPrint("📥 Foreground FCM message: ${message.notification?.body}");
      debugPrint("📥 Foreground FCM message: ${message.notification?.title}");
      debugPrint("📥 Foreground FCM message: ${message.messageType}");
      debugPrint("📥 Foreground FCM message: ${message.toString()}");
      if (message.data.isNotEmpty) {
        await handleStreamMessage(message);
      }
    });
  }

  /// Show local notification
  Future<void> showLocalNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'General Notifications',
      channelDescription: 'Notifications for chat updates',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  /// Handle Stream Chat message from FCM
  Future<void> handleStreamMessage(RemoteMessage message) async {
    try {
      final data = message.data;
      debugPrint("  handling Stream message: success");
      await showLocalNotification(title: "💬 ${data['body'] ?? 'New message'}", body: data['title'] ?? 'Message');
    } catch (e) {
      debugPrint("❌ Error handling Stream message: $e");
    }
  }

  /// Register this as the background handler in main.dart
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    debugPrint("📥 [BG] Background FCM message: ${message.data}");

    final data = message.data;

    // Use fallback values directly from FCM `data` payload
    final body = data['body'] ?? 'New message';
    final sender = data['title'] ?? 'Message';

    await showLocalNotification(title: sender, body: body);
  }


}
