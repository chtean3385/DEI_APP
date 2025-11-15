import 'package:dei_champions/constants/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../main.dart';
import '../../../providers/controllers/profile/employee_profile_completion_controller.dart';
import '../../../providers/providers.dart';
import '../../../widgets/appbar/home_app_bar.dart';
import '../All/dashboard_all_section_screen.dart';
import '../apply/apply_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_details_view.dart';
import '../saved_jobs/saved_jobs_view.dart';
import 'components/drawer/custom_drawer.dart';
import 'components/floating_filter.dart';

class BottomBar extends StatefulWidget {
  final int initialPage;
  final bool showTutorial ;
  final Map<String, dynamic>? params;

  const BottomBar({super.key, this.initialPage = 0, this.params,this.showTutorial =false});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  Map<String, dynamic>? _params;
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    _params = widget.params;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialiseController();
    });
  }

  initialiseController(){
    final providerScope =  ProviderScope.containerOf(
      navigatorKey.currentContext!,
    );
    providerScope.read(drawerProfileProvider.notifier).getEmployeeProfileData();
    providerScope.read(profileCompletionProvider.notifier).getEmployeeProfileCompletionData();
  }
  void _onTap(int index) {
    _params = null;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    showHomeTutorial(context);
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
      disabledGestures: false,
      childDecoration:  BoxDecoration(
        border: Border.all(color: Colors.black26,width: 1),

        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarHome(context,isFromHome: _currentIndex == 0,isFromProfile: _currentIndex == 3 ,  onPressed: _handleMenuButtonPressed,showTutorial: widget.showTutorial ),
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
                  key:  _getKeyForIndex(0),
                  icon: _navIcon(Icons.home_outlined, Icons.home, 0),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  key: _getKeyForIndex(1),
                  icon: _navIcon(Icons.send_outlined, Icons.send, 1),
                  label: "Applied",
                ),
                BottomNavigationBarItem(
                  key: _getKeyForIndex(2),
                  icon: _navIcon(Icons.bookmark_border_outlined, Icons.bookmark, 2),
                  label: "Saved",
                ),
                BottomNavigationBarItem(
                  key: _getKeyForIndex(3),
                  icon: _navIcon(Icons.person_outline, Icons.person, 3),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  key: _getKeyForIndex(4),
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
        floatingActionButton: _currentIndex == 0 ? FloatingFilterFab() : null,
      ),
      drawer: CustomDrawer(),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  Widget _navIcon(IconData inActiveAsset, IconData activeAsset, int index) {
    return Icon(
        _currentIndex == index ? activeAsset : inActiveAsset, size: 25);
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return  ApplyScreen(params: _params);
      case 2:
        return const SavedJobsView();
      case 3:
        return const ProfileDetailsView();
      case 4:
        return  DashBoardAllScreen();
      default:
        return SizedBox();
    }
  }
  GlobalKey? _getKeyForIndex(int index) {
    if (!(widget.showTutorial ?? false)) {
      return null; // if tutorial is off, always return null
    }
    switch (index) {
      case 0:
        return AppTutorialKeys.homeButtonKey;
      case 1:
        return AppTutorialKeys.appliedButtonKey;
      case 2:
        return AppTutorialKeys.savedButtonKey;
      case 3:
        return AppTutorialKeys.profileButtonKey;
      case 4:
        return AppTutorialKeys.dashBoardButtonKey;
      default:
        return null;
    }
  }
}
