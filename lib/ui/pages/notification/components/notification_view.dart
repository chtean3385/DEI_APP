import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/state_models/notification/notification_state.dart';
import 'package:dei_champions/ui/pages/notification/components/notification_card.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class NotificationView extends ConsumerWidget {
  NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeNotificationProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyWidget();
    } else {
      return _data(state, context);
    }
  }

  Widget _data(NotificationsState state, BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: state.data!.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) {
          return NotificationCard(notification: state.data![index]);
        },
        separatorBuilder: (c, s) => gapH8(),
      ),
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ShimmerNotificationCard();
      },
      separatorBuilder: (c, s) => gapH8(),
    );
  }
}

class MarkAllRead extends ConsumerWidget {
  const MarkAllRead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(employeeNotificationProvider.notifier);
    final state = ref.watch(employeeNotificationProvider);
    return (state.unreadCount ?? 0) > 0
        ? Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CustomThemeButton(
              child: Text(
                "Mark all read",
                style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              color: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              radius: 6,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              onTap: () => controller.markAllAsRead(),
            ),
          )
        : SizedBox.shrink();
  }
}
