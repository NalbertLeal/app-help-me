import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/login_button.dart';

class LoginPage extends HookWidget {
  static final String route = '/login';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - appBar.preferredSize.height;
    final double width = MediaQuery.of(context).size.width;
    final formKey = useState(GlobalKey<FormState>());

    final aceptedTerms = useState(false);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          width: width * .8,
          height: height,
          margin: EdgeInsets.only(left: width * .1),
          child: Form(
            key: formKey.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailField(),
                PasswordField(),
                LoginButton(
                  globalKey: formKey.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
