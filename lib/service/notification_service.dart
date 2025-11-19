import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  /// ---------------------------------------------------------------------------
  /// INITIALIZE
  /// ---------------------------------------------------------------------------
  Future<void> init() async {
    // Initialization settings
    const androidInit = AndroidInitializationSettings('@drawable/launcher_icon');
    const iosInit = DarwinInitializationSettings();
    const initSettings =
    InitializationSettings(android: androidInit, iOS: iosInit);

    // Create default notification channel
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
      const AndroidNotificationChannel(
        'default_channel',
        'General Notifications',
        description: 'Shows all app notifications',
        importance: Importance.max,
        playSound: true,
      ),
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    // Ask permissions
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Listen for foreground messages → ONLY this
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessageInternal(message);
    });
  }

  /// ---------------------------------------------------------------------------
  /// BACKGROUND HANDLER (STATIC ENTRYPOINT)
  /// ---------------------------------------------------------------------------
  static Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    await NotificationService()._handleMessageInternal(message);
  }

  /// ---------------------------------------------------------------------------
  /// MAIN MESSAGE HANDLER (foreground + background)
  /// ---------------------------------------------------------------------------
  Future<void> _handleMessageInternal(RemoteMessage message) async {
    final data = message.data;

    debugPrint("🔔 FCM DATA: $data");

    final String title = data['title'] ?? 'New message';
    final String body = data['body'] ?? '';
    final String? imageUrl = data['image'];

    // Load image if URL exists
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final bitmap = await _getBitmapFromUrl(imageUrl);
      if (bitmap != null) {
        final style = BigPictureStyleInformation(
          bitmap,
          contentTitle: title,
          summaryText: body,
        );

        final android = AndroidNotificationDetails(
          'default_channel',
          'General Notifications',
          channelDescription: 'Shows image notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          styleInformation: style,
        );

        await flutterLocalNotificationsPlugin.show(
          DateTime.now().millisecondsSinceEpoch ~/ 1000,
          title,
          body,
          NotificationDetails(android: android),
        );

        return;
      }
    }

    // 👉 Fallback notification (TEXT ONLY)
    await _showSimpleNotification(title: title, body: body);
  }

  /// ---------------------------------------------------------------------------
  /// SIMPLE NOTIFICATION
  /// ---------------------------------------------------------------------------
  Future<void> _showSimpleNotification({
    required String title,
    required String body,
  }) async {
    const android = AndroidNotificationDetails(
      'default_channel',
      'General Notifications',
      channelDescription: 'Shows basic notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(android: android),
    );
  }

  /// ---------------------------------------------------------------------------
  /// Convert image URL → ByteArray bitmap
  /// ---------------------------------------------------------------------------
  Future<ByteArrayAndroidBitmap?> _getBitmapFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes),
        );
      }
    } catch (e) {
      debugPrint('❌ Image load failed: $e');
    }
    return null;
  }
}
