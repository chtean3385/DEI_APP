import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/appbar/home_app_bar.dart';
import '../employer_dash_board/employer_dashboard_all_section_screen.dart';
import '../employer_home/employer_home_screen.dart';
import '../employer_profile/employer_profile_screen.dart';
import '../manage_jobs/manage_jobs_screen.dart';
import '../post_job/post_job_screen.dart';
import 'components/drawer/employer_custom_drawer.dart';


class EmployerBottomBar extends StatefulWidget {
  final int initialPage;

  const EmployerBottomBar({super.key, this.initialPage = 0});

  @override
  State<EmployerBottomBar> createState() => _EmployerBottomBarState();
}

class _EmployerBottomBarState extends State<EmployerBottomBar> {
  int _currentIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }

  Widget _buildMobileLayout() {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color:Colors.white,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration:  BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        border: Border.all(color: Colors.black26,width: 1),

        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarHome(context,isFromHome: _currentIndex == 0,isFromProfile: _currentIndex == 3 ,title: _currentIndex == 2 ?"Your Job Listings" :  "",  onPressed: _handleMenuButtonPressed,isEmployer: true ),
        // drawer: CustomDrawer(),
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
                  icon: _navIcon(Icons.home_outlined, Icons.home, 0),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(Icons.add_box_outlined, Icons.add_box, 1),
                  label: "Post Job",
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(Icons.work_outline, Icons.work, 2),
                  label: "Manage Job",
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(Icons.person_outline, Icons.person, 3),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(
                    Icons.description,
                    Icons.description_outlined,
                    3,
                  ),
                  label: "All",
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: EmployerCustomDrawer(),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  Widget _navIcon(IconData inActiveAsset, IconData activeAsset, int index) {
    return Icon(_currentIndex == index ? activeAsset : inActiveAsset, size: 25);
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return EmployerHomeScreen();
      case 1:
        return  PostJobScreen();
      case 2:
        return const EmployerManageJobsScreen();
      case 3:
        return const EmployerProfileScreen();
      case 4:
        return  EmployerDashBoardAllScreen();
      default:
        return SizedBox();
    }
  }
}
