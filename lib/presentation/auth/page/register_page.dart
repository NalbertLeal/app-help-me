import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/register_button.dart';
import '../providers/user_provider.dart';

class RegisterPage extends HookWidget {
  static final String route = '/resgister-user';

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    final formKey = useState(GlobalKey<FormState>());

    final userWatch = useProvider(userProvider);

    final aceptedTerms = useState(false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Text(
                      'Lembre-se, o cadastro só é preciso para fazer doações e ser responsável por um projeto.'),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (newName) => userWatch.updateName(newName),
                  ),
                  EmailField(),
                  PasswordField(),
                  Row(
                    children: [
                      Checkbox(
                        value: aceptedTerms.value,
                        onChanged: (newValue) => aceptedTerms.value = newValue,
                      ),
                      Text("Aceito os termos"),
                    ],
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  RegisterButton(
                    aceptedTerms: aceptedTerms.value,
                    globalKey: formKey.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
