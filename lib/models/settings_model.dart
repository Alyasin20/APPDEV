import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Request permissions for iOS
    await _firebaseMessaging.requestPermission();

    // Handle messages in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Handle background notification logic
    print('Handling a background message: ${message.messageId}');
  }

  Future<void> sendNotification(String title, String body) async {
    // Code to send a notification to a specific device or topic
  }
}
