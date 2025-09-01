import 'package:dei_champions/constants/app_drawables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/appbar/home_app_bar.dart';

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
      appBar:   appBarHome(context),
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: SafeArea(
        top: false,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                // blurRadius: .5,
                offset: Offset(0, -1),
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
                icon: _navIcon(Icons.home_outlined,Icons.home, 0),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon:
                _navIcon(Icons.send_outlined, Icons.send, 1),
                label: "Apply",
              ),
              BottomNavigationBarItem(
                icon: _navIcon( Icons.event_outlined,Icons.event ,  2),
                label: "NVites",
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.person_outline,Icons.person, 3),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.description,Icons.description_outlined, 3),
                label: "All",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navIcon(IconData inActiveAsset, IconData activeAsset, int index) {
    return Icon(
        _currentIndex == index ? activeAsset : inActiveAsset,
      size: 25,
    );

    //   Image.asset(
    //   _currentIndex == index ? activeAsset : inActiveAsset,
    //   height: 24,
    //   width: 24,
    // );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return  SizedBox();
      case 1:
        return const SizedBox();
      case 2:
        return const SizedBox();
      case 3:
        return const SizedBox();
      case 4:
        return const SizedBox();
      default:
        return SizedBox();
    }
  }
}
