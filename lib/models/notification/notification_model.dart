import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationModel {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final String? iconName; // FontAwesome icon name
  final Color? iconBgColor;
  final Color? statusColor;
  final bool? isRead;

  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.iconName,
    this.iconBgColor,
    this.statusColor,
    this.isRead,
  });
  /// ✅ Add copyWith for immutable updates
  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    String? iconName,
    Color? iconBgColor,
    Color? statusColor,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      iconName: iconName ?? this.iconName,
      iconBgColor: iconBgColor ?? this.iconBgColor,
      statusColor: statusColor ?? this.statusColor,
      isRead: isRead ?? this.isRead,
    );
  }

  /// Factory: Create from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      iconName: json['iconName'] as String?,
      iconBgColor: _parseColor(json['iconBgColor']),
      statusColor: _parseColor(json['statusColor']),
      isRead: json['isRead'] as bool?,
    );

  }


  /// Get FontAwesome IconData from string name
  IconData get faIcon {
    final map = {
      'briefcase': FontAwesomeIcons.briefcase,
      'calendar': FontAwesomeIcons.calendar,
      'envelope': FontAwesomeIcons.envelope,
      'fileAlt': FontAwesomeIcons.fileAlt,
      'comment': FontAwesomeIcons.comment,
      'bell': FontAwesomeIcons.bell,
      'check': FontAwesomeIcons.check,
      'user': FontAwesomeIcons.user,
    };
    return map[iconName] ?? FontAwesomeIcons.bell; // default fallback
  }

  /// Parse color from string or int
  static Color? _parseColor(dynamic value) {
    if (value == null) return null;
    try {
      return Color(int.parse(value.toString()));
    } catch (_) {
      return null;
    }
  }
}
