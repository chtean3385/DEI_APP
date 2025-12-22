import '../../models/notification/notification_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreNotificationService {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<NotificationModel>> listenNotifications(String userId) {
    return _firestore
        .collection('notifications')
        .where('receiver', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(NotificationModel.fromFirestore)
          .toList();
    });
  }

  Future<void> markAsRead(String id) {
    return _firestore.collection('notifications').doc(id).update({
      'isRead': true,
      'readAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> markAllAsRead(List<String> ids) async {
    final batch = _firestore.batch();

    for (final id in ids) {
      batch.update(
        _firestore.collection('notifications').doc(id),
        {
          'isRead': true,
          'readAt': FieldValue.serverTimestamp(),
        },
      );
    }
    await batch.commit();
  }
}

