
import 'package:dei_champions/providers/theme_controller.dart';
import 'package:dei_champions/service/notification_service.dart';
import 'package:dei_champions/ui/pages/on_board/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/app_strings.dart';
import 'constants/app_theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("🔔 Handling background message: ${message.messageId}");
  debugPrint("🔔 [BG] Message ID: ${message.messageId}");
  debugPrint("🔔 [BG] Message data: ${message.data}");
  debugPrint("🔔 [BG] Notification title: ${message.notification?.title}");
  debugPrint("🔔 [BG] Notification body: ${message.notification?.body}");
  await NotificationService().handleBackgroundMessage(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ProviderScope(child: const MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // NotificationService().init(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: AppStrings.appName,
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen()
    );
  }
}
