import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/enums.dart';
import '../../../../../models/state_models/profile/employee_profile_completion_state.dart';
import '../../../../../models/state_models/profile/employee_profile_state.dart';
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
            _drawerItem(
              Icons.search,
              "Search jobs",
              false,
              null,
              () => AppNavigator.loadJobSearchResultScreen(),
            ),
            _drawerItem(
              Icons.work_outline,
              "Recommended jobs",
              false,
              null,
              () => AppNavigator.loadRecommendedJobsScreen(),
            ),
            _drawerItem(
              Icons.bookmark_border,
              "Saved jobs",
              false,
              null,
              () => AppNavigator.loadSavedJobsScreen(),
            ),

            // _drawerItem(Icons.bar_chart, "Profile performance"),
            //
            // const Divider(color: Colors.black12),
            _drawerItem(Icons.settings, "Settings", false,
              null,
                  () => AppNavigator.loadSettingsScreen(),),

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
                  Icons.rate_review_outlined,
                  'Write to Us',
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
                // _drawerItem(
                //   Icons.article_outlined,
                //   // more suitable icon for blogs/articles
                //   'Blog',
                //   false,
                //   null,
                //   () =>
                //       AppNavigator.loaBlogScreen(), // navigate to your Blog screen
                // ),
                // _drawerItem(
                //   Icons.lock_clock_outlined,
                //   'Security',
                //   false,
                //   null,
                //   () => AppNavigator.loadHtmlDetailPage('Security'),
                // ),

                _drawerItem(
                  Icons.description_outlined,
                  'Terms & Conditions',
                  false,
                  null,
                  () => AppNavigator.loadHtmlDetailPage('Terms & Conditions'),
                ),
                //
                // _drawerItem(
                //   Icons.rule_rounded,
                //   'Terms of Use',
                //   false,
                //   null,
                //   () => AppNavigator.loadHtmlDetailPage('Terms of Use'),
                // ),
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
      visualDensity: const VisualDensity(horizontal: 2, vertical: -1),
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

class ProfileSection extends ConsumerWidget {
  final bool isEmployer;
  final bool showMissingData;

  const ProfileSection({
    super.key,
    this.isEmployer = false,
    this.showMissingData = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drawerProfileProvider);
    final profilePercentData = ref.watch(profileCompletionProvider);
    // return _loaderShowMissing();

    return state.pageState == PageState.loading
        ?( showMissingData
              ? _loaderShowMissing()
              : _loader())
        : _data(profilePercentData,state,context);
  }
  Widget _data(EmployeeProfileCompletionState data,EmployeeProfileState state,BuildContext context){
    final profilePercentData = data.profileData;
    final theme = Theme.of(context).textTheme;
    double percent = (profilePercentData?.profileCompletion ?? 0).toDouble();
    double progressValue = (percent / 100).clamp(0.0, 1.0);

    Color getProgressColor(double value) {
      if (value <= 0.25) {
        return Colors.red;
      } else if (value <= 0.75) {
        return Colors.orange;
      } else {
        return Colors.green;
      }
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          AppNavigator.loadEditProfileScreen(isEmployer: isEmployer),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: showMissingData ? const EdgeInsets.all(16) : null,
        decoration: showMissingData
            ? BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        )
            : null,

        child: Stack(
          alignment: AlignmentGeometry.topRight,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            value: progressValue,
                            strokeWidth: 5,
                            backgroundColor: Colors.black12,
                            valueColor: AlwaysStoppedAnimation(
                              getProgressColor(progressValue),
                            ),
                          ),
                        ),
                        state.profileData?.profilePhotoUrl?.isNotEmpty ==
                            true
                            ? RoundedNetworkImage(
                          imageUrl:
                          state.profileData!.profilePhotoUrl!,
                          width: 60,
                          height: 60,
                          borderRadius: 30,
                        )
                            : CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons
                                .person, // ✅ Add Profile Image icon
                            size: 30, // optional: adjust size
                            color: Colors
                                .grey
                                .shade600, // optional: adjust color
                          ),
                        ),
                      ],
                    ),
                    gapH8(),
                    _tagChip("${profilePercentData?.profileCompletion?.toString() ?? ""}%", context, getProgressColor(progressValue),),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showMissingData
                            ? (state.profileData?.name?.isNotEmpty == true ?  "${state.profileData?.name}'s Profile":"Loading...")
                            : state.profileData?.name ?? "Loading...",
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
                      // Text(
                      //   "7 Missing details",
                      //   style: theme.bodyMedium?.copyWith(
                      //     fontWeight: FontWeight.w600,
                      //     color: AppColors.primaryColor,
                      //   ),
                      // ),
                      if (showMissingData) gapH16(),
                    ],
                  ),
                ),
              ],
            ),
            if (showMissingData)
              GestureDetector(
                onTap:AppNavigator.loadEditProfileScreen ,
                behavior: HitTestBehavior.translucent,
                child: Text(
                  "${profilePercentData?.missingFieldsCount?.toString() ?? ""} Missing details",
                  style: theme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _tagChip(String tag, BuildContext context,Color textColor) {
    return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.center,
        style: context.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: textColor,
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

  Widget _loaderShowMissing() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border.all(color: Colors.white30, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ShimmerBox(height: 70, width: 70, radius: 35),
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
        ),
      ),
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
 final providerScope =  ProviderScope.containerOf(
    navigatorKey.currentContext!,
  );
  providerScope.read(drawerProfileProvider.notifier).clearState();
  providerScope.read(profileCompletionProvider.notifier).clearState();
  AppNavigator.loadSignInScreen();

}

Future<void> forceLogout({String? message}) async {
  await SharedPreferenceRepository.setToken("");
  await SharedPreferenceRepository.setUserId("");
  await SharedPreferenceRepository.setRoleId(0);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AppNavigator.loadSignInScreen();
    if (message != null) {
      showSnackBar(message, duration: 3);
    }
  });
  await Future.delayed(Duration(seconds: 1));
}


