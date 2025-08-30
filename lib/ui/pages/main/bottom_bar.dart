import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';

class BottomBar extends StatefulWidget {
  final int initialPage;

  const BottomBar({super.key, this.initialPage = 0});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar:  const CommonAppBar(),
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: 20,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.black54,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            currentIndex: _currentIndex,
            onTap: _onTap,
            items: [
              BottomNavigationBarItem(
                icon: _navIcon(AppIcons.home, AppIcons.homeFilled, 0),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon:
                _navIcon(AppIcons.milestones, AppIcons.milestonesFilled, 1),
                label: "Milestones",
              ),
              BottomNavigationBarItem(
                icon: _navIcon(AppIcons.team, AppIcons.teamFilled, 2),
                label: "Team",
              ),
              BottomNavigationBarItem(
                icon: _navIcon(AppIcons.payment, AppIcons.paymentFilled, 3),
                label: "Payment",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navIcon(String inActiveAsset, String activeAsset, int index) {
    return Image.asset(
      _currentIndex == index ? activeAsset : inActiveAsset,
      height: 24,
      width: 24,
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return const MilestoneScreen();
      case 2:
        return const TeamScreen();
      case 3:
        return const PaymentScreen();
      default:
        return HomeScreen();
    }
  }
}
