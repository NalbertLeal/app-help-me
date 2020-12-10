import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './utils/navigation.dart';
import './presentation/core/page/main_page.dart';
import './presentation/auth/page/login_page.dart';
import './presentation/auth/page/register_page.dart';
import './presentation/projects/page/find_projects.dart';
import './presentation/projects/page/projetc_profile.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelpMe',
      navigatorKey: Navigation().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightBlue,
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: MainPage(),
      routes: {
        LoginPage.route: (_) => LoginPage(),
        RegisterPage.route: (_) => RegisterPage(),
        FindProjectPage.route: (_) => FindProjectPage(),
        ProjectProfilePage.route: (_) => ProjectProfilePage(),
      },
    );
  }
}