import 'package:dei_champions/models/notification/notification_model.dart';
import 'package:dei_champions/models/state_models/notification/notification_state.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:dei_champions/service/notification/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../service/notification/firestore_notification_service.dart';

class NotificationController extends StateNotifier<NotificationsState> {
  final FirestoreNotificationService _service;
  final Ref ref;

  NotificationController(this.ref)
      : _service = FirestoreNotificationService(),
        super(NotificationsState.initial()) {
    _startListening();
  }

  Future<void> _startListening() async {
    final userId = await SharedPreferenceRepository.getUserId();
    state = state.copyWith(pageState: PageState.loading);

    _service.listenNotifications(userId).listen(
          (list) {
        state = state.copyWith(
          pageState: PageState.success,
          data: list,
          unreadCount: _calculateUnreadCount(list),
        );
      },
      onError: (e) {
        state = state.copyWith(
          pageState: PageState.error,
          errorMessage: e.toString(),
        );
      },
    );
  }

  int _calculateUnreadCount(List<NotificationModel> list) =>
      list.where((n) => !n.isRead).length;

  /// 🔹 Firestore update
  Future<void> markAllAsRead() async {
    final unreadIds = state.data
        ?.where((e) => !e.isRead)
        .map((e) => e.id)
        .toList() ??
        [];

    await _service.markAllAsRead(unreadIds);
  }

  /// 🔹 Firestore update
  Future<void> markAsRead(String id) async {
    await _service.markAsRead(id);
  }
}


