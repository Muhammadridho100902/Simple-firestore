import 'package:firebase/login_page.dart';
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';

const String bodyPage = 'Body';
const String loginPage = 'login_page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case bodyPage:
      return MaterialPageRoute(builder: (context) => Body());
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());

    default:
      throw ('This route name does not exit');
  }
}
