import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants/enums.dart';
import '../../../../../providers/providers.dart';
import '../../../../../repo/shared_preference_repository.dart';
import '../../../../../utils/widget_utils.dart';
import '../../../../../widgets/others/rounded_network_image.dart';
import '../../../../../widgets/others/shimmer_loader.dart';
import '../../../../../widgets/others/snack_bar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            // 🔹 Profile Section
            ProfileSection(),

            const Divider(color: Colors.black12),

            // 🔹 Job Actions
            // _drawerItem(Icons.visibility, "Actively searching jobs", true),
            _drawerItem(Icons.search, "Search jobs",  false,
                null,
                    () => AppNavigator.loadJobSearchResultScreen()),
            _drawerItem(Icons.work_outline, "Recommended jobs"),
            _drawerItem(Icons.bookmark_border, "Saved jobs",  false,
                null,
                    () => AppNavigator.loadSavedJobsScreen()),
            // _drawerItem(Icons.bar_chart, "Profile performance"),
            //
            // const Divider(color: Colors.black12),

            _drawerItem(Icons.settings, "Settings"),
            //
            // const Divider(color: Colors.black12),


            // _drawerItem(Icons.woman_outlined, "Empower Women", false, // bold
            //     null,  // badge
            //         () =>AppNavigator.loadEmpowerWomenScreen()),
            // _drawerItem(Icons.man, "Men as Allies", false, // bold
            //     null,  // badge
            //         () =>AppNavigator.loadMenAsAliasScreen()),
            // _drawerItem(Icons.accessible_forward, "Not Defined by Disability", false,
            //     null,
            //         () => AppNavigator.loadNotDefinedByDisabilityScreen()),
            // _drawerItem(
            //   Icons.auto_awesome,
            //   "Gen Z",
            //   false,
            //   null,
            //       () => AppNavigator.loadGenZScreen(),
            // ),
            // _drawerItem(
            //   Icons.military_tech,
            //   "Defense Veteran",
            //   false,
            //   null,
            //       () => AppNavigator.loadVeteranScreen(),
            // ),
            // _drawerItem(
            //   Icons.diversity_3,
            //   "Shine with Pride",
            //   false,
            //   null,
            //       () => AppNavigator.loadLgbtqScreen(),
            // ),
            // _drawerItem(
            //   Icons.explore,
            //   "Career Explorers",
            //   false,
            //   null,
            //   () => AppNavigator.loadCareerExplorersScreen(),
            // ),
            // _drawerItem(
            //   Icons.corporate_fare,
            //   "Corporates Championing",
            //   false,
            //   null,
            //   () => AppNavigator.loadCorporatesChampioningScreen(),
            // ),
            // _drawerItem(
            //   FontAwesomeIcons.handshake,
            //   "Corporate Social Responsibility",
            //   false,
            //   null,
            //   () => AppNavigator.loadCSR(),
            // ),

            _drawerItem(
              Icons.info_outline,
              "About us",
              false, // bold
              null, // badge
              () => AppNavigator.loadAboutUsScreen(),
            ),
            Column(
              children: [
                // _drawerItem(
                //   Icons.privacy_tip_outlined,
                //   'Our Team',
                //   false,
                //   null,
                //   () => AppNavigator.loadOurTeams(),
                // ),
                _drawerItem(
                  Icons.support_agent_outlined,
                  'Contact',
                  false,
                  null,
                  () =>
                      AppNavigator.loadLetsConnect(), // or whatever your contact route is
                ),
                _drawerItem(
                  Icons.help_outline,
                  'FAQ',
                  false,
                  null,
                  () =>
                      AppNavigator.loadFaqScreen(), // navigate to your FAQ screen
                ),
                _drawerItem(
                  Icons.article_outlined,
                  // more suitable icon for blogs/articles
                  'Blog',
                  false,
                  null,
                  () =>
                      AppNavigator.loaBlogScreen(), // navigate to your Blog screen
                ),
                _drawerItem(
                  Icons.lock_clock_outlined,
                  'Security',
                  false,
                  null,
                      () => AppNavigator.loadHtmlDetailPage('Security'),
                ),

                _drawerItem(
                  Icons.description_outlined,
                  'Terms & Conditions',
                  false,
                  null,
                  () => AppNavigator.loadHtmlDetailPage('Terms & Conditions'),
                ),

                _drawerItem(
                  Icons.rule_rounded,
                  'Terms of Use',
                  false,
                  null,
                  () => AppNavigator.loadHtmlDetailPage('Terms of Use'),
                ),
                // _drawerItem(
                //   Icons.accessibility_new_outlined,
                //   'Accessibility',
                //   false,
                //   null,
                //   () => AppNavigator.loadHtmlDetailPage('Accessibility'),
                // ),
                _drawerItem(
                  Icons.privacy_tip_outlined,
                  'Privacy Policy',
                  false,
                  null,
                  () => AppNavigator.loadHtmlDetailPage('Privacy Policy'),
                ),
              ],
            ),

            _drawerItem(
              Icons.logout,
              "Logout",
              false, // bold
              null, // badge
              () {
                logoutAlertBox();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    IconData icon,
    String text, [
    bool bold = false,
    String? badge,
    VoidCallback? onTap, // ✅ added as optional positional param
  ]) {
    final theme = Theme.of(navigatorKey.currentContext!);
    return ListTile(
      dense: true,
      leading: Icon(icon, color: Colors.black87, size: 20),
      // visualDensity: VisualDensity.compact,
      visualDensity: const VisualDensity(horizontal:2, vertical: -1),
      title: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
        ),
      ),
      onTap: onTap, // ✅ use it here
    );
  }
}

void logoutAlertBox() {
  WidgetUtils.showLogoutPopUp(
    navigatorKey.currentContext!,
    sBtnFunction: () => signOut(),
  );
}

Future<void> signOut() async {
  await SharedPreferenceRepository.setToken("");
  await SharedPreferenceRepository.setUserId("");
  await SharedPreferenceRepository.setRoleId(0);
  await SharedPreferenceRepository.setHasUploadedResume(false);
  AppNavigator.loadSignInScreen();
}

Future<void> forceLogout({String? message}) async {
  await SharedPreferenceRepository.setToken("");
  await SharedPreferenceRepository.setUserId("");
  await SharedPreferenceRepository.setRoleId(0);
  await SharedPreferenceRepository.setHasUploadedResume(false);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AppNavigator.loadSignInScreen();
    if (message != null) {
      showSnackBar(message, duration: 3);
    }
  });
  await Future.delayed(Duration(seconds: 1));
}

class ProfileSection extends ConsumerWidget {
  final  bool isEmployer;
  const ProfileSection({super.key,this.isEmployer = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drawerProfileProvider);
    return state.pageState == PageState.loading
        ? _loader()
        : GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          AppNavigator.loadEditProfileScreen(isEmployer: isEmployer),
          child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.transparent,
              child: Row(
                children: [
                  state.profileData?.profilePhotoUrl?.isNotEmpty == true
                      ? RoundedNetworkImage(
                          imageUrl: state.profileData!.profilePhotoUrl!,
                          width: 60,
                          height: 60,
                          borderRadius: 30,
                        )
                      : CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.person_add, // ✅ Add Profile Image icon
                            size: 30, // optional: adjust size
                            color: Colors.grey.shade600, // optional: adjust color
                          ),
                        ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.profileData?.name ?? "Loading...",
                          style: context.textTheme.labelMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        Text(
                          "Update profile",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        );
  }

  Widget _loader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShimmerLoader(
        child: Row(
          children: [
            ShimmerBox(height: 60, width: 60, radius: 30),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 12, width: 80),
                SizedBox(height: 2),
                ShimmerBox(height: 8, width: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
