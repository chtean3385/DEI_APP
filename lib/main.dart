import 'package:dei_champions/providers/theme_controller.dart';
import 'package:dei_champions/service/notification_service.dart';
import 'package:dei_champions/ui/pages/on_board/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/app_strings.dart';
import 'constants/app_theme.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.ncurrentPlatform);
  FirebaseMessaging.onBackgroundMessage(
      NotificationService.firebaseBackgroundHandler);

  await NotificationService().init();
  // Lock app to portrait mode only
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
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
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider);
    final accessibility = ref.watch(accessibilityProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: AppStrings.appName,
      theme: lightTheme(context, accessibility),
      darkTheme: darkTheme(context, accessibility),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,  // 🚫 stops system text-size from affecting UI
          ),
          child: child!,
        );
      },
    );
  }
}
