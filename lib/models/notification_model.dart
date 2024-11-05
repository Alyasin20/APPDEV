class NotificationModel {
  String notificationId;
  String userId;
  String itemId;
  DateTime notificationDate;

  NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.itemId,
    required this.notificationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'notification_id': notificationId,
      'user_id': userId,
      'item_id': itemId,
      'notification_date': notificationDate.toIso8601String(),
    };
  }

  NotificationModel.fromMap(Map<String, dynamic> map)
      : notificationId = map['notification_id'],
        userId = map['user_id'],
        itemId = map['item_id'],
        notificationDate = DateTime.parse(map['notification_date']);
}
