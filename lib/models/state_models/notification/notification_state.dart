import 'package:dei_champions/constants/enums.dart';
import '../../notification/notification_model.dart';



class NotificationsState {
  final PageState pageState;
  final List<NotificationModel>? data;
  final String? errorMessage;
  final int? unreadCount;
  NotificationsState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.unreadCount,
  });
  factory NotificationsState.initial() => NotificationsState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    unreadCount: null,
  );
  NotificationsState copyWith({
    PageState? pageState,
    List<NotificationModel>? data,
    String? errorMessage,
    int? unreadCount,
  }) {
    return NotificationsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
