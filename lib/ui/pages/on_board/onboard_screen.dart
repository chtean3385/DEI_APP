import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/others/custom_theme_button.dart';

class OnBoardScreen extends ConsumerStatefulWidget {
  const OnBoardScreen({super.key});

  @override
  ConsumerState<OnBoardScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<OnBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [backgroundImage(), textView()],
            ),
          ),
          _indicator(),
          const SizedBox(height: 20),
          _button(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _indicator(){
    return CircleAvatar(
      radius: 5,
      backgroundColor: AppColors.primaryColor,
    );
  }

  Widget textView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 40),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "We are the best job portal platform",
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
              // color: Colors.white,
              // fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget backgroundImage() {
    return Image.asset(
      AppDrawables.onBoard1,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomThemeButton(
        // isLoading: pageState == PageState.loading,
        color: AppColors.primaryColor,
        radius: 30,
        height: 56,
        isExpanded: true,
        onTap: () {
          // if (_formKey.currentState?.validate() == true) {
          //   controller.signIn();
          // }
        },
        child: Text(
          "Next",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
