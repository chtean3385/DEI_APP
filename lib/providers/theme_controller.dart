import 'package:dei_champions/models/accessibility/acccessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repo/shared_preference_repository.dart';

// final themeNotifierProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

final themeNotifierProvider = StateProvider<ThemeMode>((ref) {
  final themeAsync = ref.watch(themeFutureProvider);

  return themeAsync.when(
    data: (theme) => theme,
    loading: () => ThemeMode.light,   // temporary
    error: (_, __) => ThemeMode.light,
  );
});

final themeFutureProvider = FutureProvider<ThemeMode>((ref) async {
  final value = await SharedPreferenceRepository.getTheme();

  switch (value) {
    case 'dark':
      return ThemeMode.dark;
    case 'light':
      return ThemeMode.light;
    case 'system':
      return ThemeMode.system;
  }

  return ThemeMode.light; // default
});



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
  final String? profileMode;
  final Color buttonColor;

  const UserSettingsModel({
    this.notifications = true,
    this.emailAlert = false,
    this.smsAlert = false,
    this.profileMode,
    this.buttonColor = Colors.blue,
  });

  UserSettingsModel copyWith({
    bool? notifications,
    bool? emailAlert,
    bool? smsAlert,
    Color? buttonColor,
    String? profileMode,
  }) {
    return UserSettingsModel(
      notifications: notifications ?? this.notifications,
      emailAlert: emailAlert ?? this.emailAlert,
      smsAlert: smsAlert ?? this.smsAlert,
      buttonColor: buttonColor ?? this.buttonColor,
      profileMode: profileMode ?? this.profileMode,
    );
  }
}

