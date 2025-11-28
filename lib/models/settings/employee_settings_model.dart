
class EmployeeSettingsModel {
  final String privacyMode;
  final bool notifications;
  final bool smsAlerts;
  final EmailAlertsModel emailAlerts;

  EmployeeSettingsModel({
    required this.privacyMode,
    required this.notifications,
    required this.smsAlerts,
    required this.emailAlerts,
  });

  factory EmployeeSettingsModel.fromJson(Map<String, dynamic> json) {
    return EmployeeSettingsModel(
      privacyMode: json['privacyMode'] ?? '',
      notifications: json['notifications'] ?? false,
      smsAlerts: json['smsAlerts'] ?? false,
      emailAlerts: EmailAlertsModel.fromJson(json['emailAlerts'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'privacyMode': privacyMode,
      'notifications': notifications,
      'smsAlerts': smsAlerts,
      'emailAlerts': emailAlerts.toJson(),
    };
  }
  EmployeeSettingsModel copyWith({
    String? privacyMode,
    bool? notifications,
    bool? smsAlerts,
    EmailAlertsModel? emailAlerts,
  }) {
    return EmployeeSettingsModel(
      privacyMode: privacyMode ?? this.privacyMode,
      notifications: notifications ?? this.notifications,
      smsAlerts: smsAlerts ?? this.smsAlerts,
      emailAlerts: emailAlerts ?? this.emailAlerts,
    );
  }

}

class EmailAlertsModel {
  final bool jobAlerts;
  final bool estimateAlerts;
  final bool invoiceAlerts;
  final bool serviceAlerts;
  final bool serviceExpiredAlerts;
  final bool jobApplicationAlerts;
  final bool profileAlerts;

  EmailAlertsModel({
    required this.jobAlerts,
    required this.estimateAlerts,
    required this.invoiceAlerts,
    required this.serviceAlerts,
    required this.serviceExpiredAlerts,
    required this.jobApplicationAlerts,
    required this.profileAlerts,
  });

  factory EmailAlertsModel.fromJson(Map<String, dynamic> json) {
    return EmailAlertsModel(
      jobAlerts: json['jobAlerts'] ?? false,
      estimateAlerts: json['estimateAlerts'] ?? false,
      invoiceAlerts: json['invoiceAlerts'] ?? false,
      serviceAlerts: json['serviceAlerts'] ?? false,
      serviceExpiredAlerts: json['serviceExpiredAlerts'] ?? false,
      jobApplicationAlerts: json['jobApplicationAlerts'] ?? false,
      profileAlerts: json['profileAlerts'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    "jobAlerts": jobAlerts,
    "estimateAlerts": estimateAlerts,
    "invoiceAlerts": invoiceAlerts,
    "serviceAlerts": serviceAlerts,
    "serviceExpiredAlerts": serviceExpiredAlerts,
    "jobApplicationAlerts": jobApplicationAlerts,
    "profileAlerts": profileAlerts,
  };

  EmailAlertsModel copyWith({
    bool? jobAlerts,
    bool? estimateAlerts,
    bool? invoiceAlerts,
    bool? serviceAlerts,
    bool? serviceExpiredAlerts,
    bool? jobApplicationAlerts,
    bool? profileAlerts,
  }) {
    return EmailAlertsModel(
      jobAlerts: jobAlerts ?? this.jobAlerts,
      estimateAlerts: estimateAlerts ?? this.estimateAlerts,
      invoiceAlerts: invoiceAlerts ?? this.invoiceAlerts,
      serviceAlerts: serviceAlerts ?? this.serviceAlerts,
      serviceExpiredAlerts: serviceExpiredAlerts ?? this.serviceExpiredAlerts,
      jobApplicationAlerts:
      jobApplicationAlerts ?? this.jobApplicationAlerts,
      profileAlerts: profileAlerts ?? this.profileAlerts,
    );
  }

}

