import 'package:dei_champions/models/notification/notification_model.dart';
import 'package:dei_champions/models/state_models/notification/notification_state.dart';
import 'package:dei_champions/service/notification/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class NotificationController extends StateNotifier<NotificationsState> {
  final NotificationService _service = NotificationService();

  NotificationController() : super(NotificationsState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await Future.delayed(Duration(seconds: 2));
      final result = await _service.getNotificationsData();
      final List<dynamic>? list = result.data as List<dynamic>?;
      final List<NotificationModel> data = list != null
          ? list
          .map(
            (e) => NotificationModel.fromJson(e as Map<String, dynamic>),
      )
          .toList()
          : [];
      state = state.copyWith(pageState: PageState.success, data: data,unreadCount: _calculateUnreadCount(data),);
    } catch (e, st) {
      debugPrint("❌ catch NotificationController fetchData - $e");
      debugPrintStack(stackTrace: st);
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }

  /// 🔹 Calculate unread notifications count
  int _calculateUnreadCount(List<NotificationModel> list) =>
      list
          .where((n) => n.isRead == false)
          .length;

  /// 🔹 Mark all notifications as read
  void markAllAsRead() {
    final current = state.data ?? [];
    final updated = current.map((n) => n.copyWith(isRead: true)).toList();

    state = state.copyWith(
      data: updated,
      unreadCount: _calculateUnreadCount(updated),
    );
  }

  /// 🔹 Toggle single notification
  void toggleNotificationRead(String id) {
    final current = state.data ?? [];
    final updated = current.map((n) {
      if (n.id == id) {
        return n.copyWith(isRead: !(n.isRead ?? false));
      }
      return n;
    }).toList();

    state = state.copyWith(
      data: updated,
      unreadCount: _calculateUnreadCount(updated),
    );
  }
}
