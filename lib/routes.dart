

import 'package:apidemo_app/FirstTask/firstTask.dart';
import 'package:apidemo_app/MainScreen/mainScreen.dart';
import 'package:apidemo_app/SecondTask/secondTask.dart';
import 'package:apidemo_app/ThirdTask/thirdTask.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  FirstTask.routeName: (context) => FirstTask(),
  SecondTask.routeName: (context) => SecondTask(),
  ThirdTask.routeName: (context) => ThirdTask(),

};