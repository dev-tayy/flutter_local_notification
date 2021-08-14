import 'package:flutter/material.dart';
import 'package:tasker/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.indigo.shade900,
          appBarTheme: AppBarTheme(color: Colors.indigo.shade900)),
      home: MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Show Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      await _notificationService.showNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                  RaisedButton(
                    child: Text('Schedule Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      await _notificationService.scheduleNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                  RaisedButton(
                    child: Text('Cancel Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      await _notificationService.cancelNotifications(0);
                    },
                  ),
                  SizedBox(height: 3),
                  RaisedButton(
                    child: Text('Cancel All Notifications'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      await _notificationService.cancelAllNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                ],
              ),
            )));
  }
}
