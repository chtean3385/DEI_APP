import 'package:dei_champions/constants/app_drawables.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../utils/widget_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(appProvider.notifier).fetchAppDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double responsivePadding = screenWidth * 0.1; // 10% of screen width
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppDrawables.splash), // your bg image
            fit: BoxFit.cover, // cover / contain / fill depending on need
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(responsivePadding.clamp(16.0, 50.0)),
            child: WidgetUtils.logoWidget(),
          ),
        ),
      ),
    );
  }
}
