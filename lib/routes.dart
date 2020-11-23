import 'package:flutter/material.dart';
import 'HomePage.dart';




class AppRoutes {
  AppRoutes._();

  static const String menu = '/menu';

  static Map<String, WidgetBuilder> define() {
    return {
      menu: (context) => HomePage(),
    };
  }
}