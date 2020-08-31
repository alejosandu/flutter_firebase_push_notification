import 'package:flutter/material.dart';
import 'package:flutter_push_notification/pages/home_page.dart';
import 'package:flutter_push_notification/pages/mensaje_page.dart';
import 'package:flutter_push_notification/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    PushNotificationProvider(onMessage: _receiveNotification).configClass();
  }

  Future _receiveNotification(Map message) async {
    navigatorKey.currentState.pushNamed("mensaje");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Push notifications',
      initialRoute: "home",
      routes: {
        "home": (_) => HomePage(),
        "mensaje": (_) => MensajePage(),
      },
    );
  }
}
