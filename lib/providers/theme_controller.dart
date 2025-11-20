import 'package:dei_champions/models/accessibility/acccessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);


class AccessibilityController extends Notifier<AccessibilitySettingsModel> {
  @override
  AccessibilitySettingsModel build() => const AccessibilitySettingsModel();

  void increaseFont() {
    state = state.copyWith(fontScale: (state.fontScale + 0.1).clamp(0.8, 1.5));
  }

  void decreaseFont() {
    state = state.copyWith(fontScale: (state.fontScale - 0.1).clamp(0.8, 1.5));
  }

  void setButtonColor(Color color) {
    state = state.copyWith(buttonColor: color);
  }
}

final accessibilityProvider =
NotifierProvider<AccessibilityController, AccessibilitySettingsModel>(
    AccessibilityController.new);


// -----------------------------------------------------
// MODEL
// -----------------------------------------------------
class UserSettingsModel {
  final bool notifications;
  final bool emailAlert;
  final bool smsAlert;
  final Color buttonColor;

  const UserSettingsModel({
    this.notifications = true,
    this.emailAlert = false,
    this.smsAlert = false,
    this.buttonColor = Colors.blue,
  });

  UserSettingsModel copyWith({
    bool? notifications,
    bool? emailAlert,
    bool? smsAlert,
    Color? buttonColor,
  }) {
    return UserSettingsModel(
      notifications: notifications ?? this.notifications,
      emailAlert: emailAlert ?? this.emailAlert,
      smsAlert: smsAlert ?? this.smsAlert,
      buttonColor: buttonColor ?? this.buttonColor,
    );
  }
}

// -----------------------------------------------------
// CONTROLLER
// -----------------------------------------------------
class UserSettingsController extends Notifier<UserSettingsModel> {
  @override
  UserSettingsModel build() => const UserSettingsModel();

  void toggleNotifications(bool val) {
    state = state.copyWith(notifications: val);
  }

  void toggleEmail(bool val) {
    state = state.copyWith(emailAlert: val);
  }

  void toggleSMS(bool val) {
    state = state.copyWith(smsAlert: val);
  }

  void setButtonColor(Color color) {
    state = state.copyWith(buttonColor: color);
  }
}

final userSettingsProvider =
NotifierProvider<UserSettingsController, UserSettingsModel>(
    UserSettingsController.new);
