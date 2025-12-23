import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/state_models/notification/notification_state.dart';
import 'package:dei_champions/ui/pages/notification/components/notification_card.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_navigator.dart';
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
      return _data(state, context,ref);
    }
  }

  Widget _data(NotificationsState state, BuildContext context,WidgetRef ref) {
    final controller = ref.read(employeeNotificationProvider.notifier);
    final length = state.data?.length ?? 0;

    return  SafeArea(
      child: length > 0 ? ListView.separated(
        itemCount: state.data!.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) {
          final notification = state.data![index]; // 👈 THIS LINE
          return NotificationCard(notification: notification,
            onTap: (){
              controller.markAsRead(notification.id);
            });
        },
        separatorBuilder: (c, s) => gapH8(),
      ) : EmptyWidget(),
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



class NotificationIconButton extends ConsumerWidget {
  const NotificationIconButton({super.key, this.showTutorial = false});

  final bool showTutorial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeNotificationProvider);
    final unreadCount = state.unreadCount ?? 0;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          AppNavigator.loadEmployeeNotificationsScreen(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: context.colors.black45,
              size: 25,
            ),
            onPressed: null,
          ),

          /// 🔴 RED BADGE
          if (unreadCount > 0)
            Positioned(
              top: 6,
              right: 6,
              child: _Badge(count: unreadCount),
            ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final int count;

  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    final text = count > 99 ? '99+' : count.toString();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints(
        minWidth: 18,
        minHeight: 18,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
