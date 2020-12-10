import "package:flutter/material.dart";

class Navigation {
  static Navigation _instance;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Navigation() {
    if (Navigation._instance == null) {
      Navigation._instance = Navigation._internal();
    }

    return Navigation._instance;
  }

  Navigation._internal();

  Future<dynamic> navigatoTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> substitute(String routeName) {
    return navigatorKey.currentState.popAndPushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}