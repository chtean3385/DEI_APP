import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final String type;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.type,
    required this.isRead,
  });

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      type: type,
      isRead: isRead ?? this.isRead,
    );
  }

  /// 🔥 Firestore factory
  factory NotificationModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    // print("datadatadatadata   ${data['createdAt']}");
    // print("datadatadatadata   ${data['title']}");
    // print("datadatadatadata   ${data['message']}");
    // print("datadatadatadata   ${data['type']}");
    // print("datadatadatadata   ${data['isRead']}");
    // print("datadatadatadata   ${data['_id']}");
    return NotificationModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['message'] ?? '',
      type: data['type'] ?? 'default',
      isRead: data['isRead'] ?? false,
      createdAt: parseCreatedAt(data['createdAt']),
    );
  }
}

DateTime parseCreatedAt(dynamic value) {
  if (value == null) return DateTime.now();

  if (value is Timestamp) {
    return value.toDate();
  }

  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }

  return DateTime.now();
}
