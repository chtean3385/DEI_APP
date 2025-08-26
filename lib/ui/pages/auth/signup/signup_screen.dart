import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/basic_info.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import 'components/backround_image_overlay.dart';
import 'components/gradient_overlay.dart';
import 'components/registration_progress_bar.dart';
import 'components/signup_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int currentStep = 0;
  final int totalSteps = 8;

  final List<GlobalKey<FormState>> _formKeys = List.generate(8, (_) => GlobalKey<FormState>());


  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
  void nextStep() {
    if (_formKeys[currentStep].currentState!.validate()) {
      if (currentStep < totalSteps - 1) {
        setState(() {
          currentStep++;
        });
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // submitRegistration(context);
      }
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: Stack(
          children: [
            // Background Image with Overlay
            BackgroundImageOverlay(
              imagePath: AppDrawables.signupBg,
              darkenOpacity: 0.5,
            ),
            // Gradient Overlay
            GradientOverlay(),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        SignupHeader(),
                        // Signup Form
                        RegistrationProgressBar(currentStep: 0,totalSteps: 2,),
                        gap16(),
                        // BasicPersonalInfo(),
                        IntrinsicHeight(
                          child: SizedBox(height: MediaQuery.of(context).size.height*.9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: PageView(
                                controller: _pageController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  BasicPersonalInfo(formKey:_formKeys[0] ,),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}