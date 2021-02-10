import 'package:apidemo_app/MainScreen/mainScreen.dart';
import 'package:apidemo_app/ThirdTask/thirdTask.dart';
import 'package:apidemo_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: MainScreen.routeName,
      routes: routes,

    );
  }
}
