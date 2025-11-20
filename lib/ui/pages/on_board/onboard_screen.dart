import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/enums.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/others/custom_theme_button.dart';

class OnBoardScreen extends ConsumerStatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends ConsumerState<OnBoardScreen> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _view(),
    );
  }
  Widget _view(){
    final state = ref.watch(onBoardingProvider);
    final hasData = (state.data ?? []).isNotEmpty;
    if (!hasData && state.pageState != PageState.loading) {
      return Center(
        child: SizedBox(
          height: 200,width: 200,
          child: WidgetUtils.logoWidget(),
        ),
      );
    }
    if ( state.pageState == PageState.error) {
      return SizedBox(
        height: 200,width: 200,
        child: WidgetUtils.logoWidget(),
      );
    }
    return  state.pageState == PageState.loading ? _loading()  :
    Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: state.data!.length,
            itemBuilder: (context, index) {
              final actualIndex = index % state.data!.length;
              final item = state.data![actualIndex];
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  backgroundImage(item.image ?? ""),
                  textView(item.title ?? "", item.subTitle ?? ""),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(state.data!.length, (index) {
            final isActive = (_currentPage % state.data!.length).round() == index;

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
        _button(state.data![_currentPage.round()].buttonText ?? "",state.data!.length),
        const SizedBox(height: 30),
      ],
    );
  }
  Widget _loading(){
    return   Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _shimmerImage(),
              shimmerTextView(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ShimmerLoader(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              final isActive = index == 0;

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
        ),
        const SizedBox(height: 20),
        ShimmerLoader(child: _button("Next",0)),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget backgroundImage(String image) {
    return RoundedNetworkImage(
     imageUrl:image,
      borderRadius: 0,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
  Widget _shimmerImage() {
    return ShimmerLoader(
      child: ColoredBox(
        color: Colors.white,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget textView(String text, String subTitle) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 280),
      decoration: const BoxDecoration(
        color: Colors.white,
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
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget shimmerTextView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(minHeight: 280),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border.all(color:Colors.white,width: 2 ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45, // subtle shadow color
            offset: Offset(0, -4), // negative Y offset = shadow on top
            blurRadius: 8, // softness of shadow
            spreadRadius: 1, // optional: how much the shadow spreads
          ),
        ],
      ),
      child: ShimmerLoader(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 28, width: 300),
            ),
            const SizedBox(height: 4),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 28, width: 300),
            ),

            const SizedBox(height: 30),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 12, width: 300),
            ),
            const SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 12, width: 300),
            ),
            const SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 12, width: 300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String buttonText,int listLength) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomThemeButton(
        color: AppColors.primaryColor,
        radius: 30,
        height: 56,
        isExpanded: true,
        onTap: () async {
          if(listLength>0){
            // Check if current page is the last one
            if (_currentPage.round() == listLength - 1) {
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
          }
        },
        child: Text(
          buttonText,
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
