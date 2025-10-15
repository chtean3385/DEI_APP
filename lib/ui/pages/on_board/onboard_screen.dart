import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../models/on_board/on_board_model.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../widgets/others/custom_theme_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late final PageController _controller;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static List<OnBoardModel> items = [
    OnBoardModel(
      title: "India’s Most Inclusive Job Platform",
      subTitle:
          "Join a trusted space where diversity, equity, and inclusion drive every opportunity — connecting skilled professionals with forward-thinking employers.",
      buttonText: "Next",
      image: AppDrawables.onBoard1,
    ),
    OnBoardModel(
      title: "Opportunities That Value You",
      subTitle:
          "Explore jobs with organizations that prioritize fair hiring, equal growth, and inclusive workplace cultures built on respect and representation.",
      buttonText: "Next",
      image: AppDrawables.onBoard2,
    ),
    OnBoardModel(
      title: "Empowering Diverse Talent to Thrive",
      subTitle:
          "Build a career that aligns with your values. Together, we’re shaping India’s future workforce — inclusive, equitable, and full of possibilities.",
      buttonText: "Get Started",
      image: AppDrawables.onBoard3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final actualIndex = index % items.length;
                final item = items[actualIndex];
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    backgroundImage(item.image),
                    textView(item.title, item.subTitle),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (index) {
              final isActive = (_currentPage % items.length).round() == index;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: CircleAvatar(
                  radius: isActive ? 6 : 3,
                  backgroundColor: isActive
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          _button(items[_currentPage.round()].buttonText),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget backgroundImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget textView(String text, String subTitle) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 280),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45, // subtle shadow color
            offset: Offset(0, -4), // negative Y offset = shadow on top
            blurRadius: 8, // softness of shadow
            spreadRadius: 1, // optional: how much the shadow spreads
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.textTheme.headlineMedium?.copyWith(
              // fontWeight: FontWeight.w900,
              color: AppColors.primaryColor,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            subTitle,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _button(String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomThemeButton(
        color: AppColors.primaryColor,
        radius: 30,
        height: 56,
        isExpanded: true,
        onTap: () async {
          // Check if current page is the last one
          if (_currentPage.round() == items.length - 1) {
            // 👉 Navigate to login screen
           AppNavigator.loadSignInScreen();
           SharedPreferenceRepository.setHasSeenOnboarding(true);
          } else {
            // 👉 Go to next page
            await _controller.nextPage(
              duration: const Duration(milliseconds: 900),
              curve: Curves.fastOutSlowIn,
            );
          }
        },
        child: Text(
          buttonText,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
