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
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: SizedBox(
            height: 200,width: 200,
            child: WidgetUtils.logoWidget(),
          ),
        ),
      ),
    );
  }
}
