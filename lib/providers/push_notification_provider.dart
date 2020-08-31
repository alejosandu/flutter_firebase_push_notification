import 'package:firebase_messaging/firebase_messaging.dart';

typedef Future<void> NotificationHandler(Map<String, dynamic> message);

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final NotificationHandler onMessage;

  PushNotificationProvider({
    this.onMessage,
  }) {
    //
  }

  configClass() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print("token: $token");

    _firebaseMessaging.configure(
      onMessage: _onMessage,
      onBackgroundMessage: _onBackgroundMessage,
      onLaunch: _onLaunch,
      onResume: _onResume,
    );
  }

  ///Background servirce running to work on received message
  static Future<dynamic> _onBackgroundMessage(
    Map<String, dynamic> message,
  ) async {
    print("onBackgroundMessage: $message");
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  Future<dynamic> _onMessage(
    Map<String, dynamic> message,
  ) async {
    print("onMessage: $message");
    onMessage(message);
  }

  Future<dynamic> _onLaunch(
    Map<String, dynamic> message,
  ) async {
    print("onLaunch: $message");
    onMessage(message);
  }

  Future<dynamic> _onResume(
    Map<String, dynamic> message,
  ) async {
    print("onResume: $message");
    onMessage(message);
  }
}
