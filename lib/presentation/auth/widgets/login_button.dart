import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/user_provider.dart';
import '../../../exceptions/user_already_loged_in.dart';
import '../../../utils/navigation.dart';
import '../../projects/page/find_projects.dart';
import '../../../utils/navigation.dart';
import '../../projects/page/find_projects.dart';
import '../../../exceptions/invalid_user_credention.dart';
import '../../../exceptions/no_user_found.dart';
import '../../projects/providers/project_provider.dart';

class LoginButton extends HookWidget {
  final GlobalKey<FormState> globalKey;

  LoginButton({this.globalKey});

  Future<void> login(UserProvider userWatch, BuildContext context,
      ProjectProvider projectWatch) async {
    try {
      await userWatch.login(globalKey);
      projectWatch.usuarioLogado = true;
      Navigation().navigatoTo(FindProjectPage.route);
    } on UserAlreadyLogedIn {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario já está logado.'),
        ),
      );
    } on InvalidUserCredention {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Usuario invalido, por favor verifique as suas credenciais.'),
        ),
      );
    } on NoUserFound {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario não foi encontrado.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userWatch = useProvider(userProvider);
    final projectWatch = useProvider(projectProvider);

    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * .8,
      height: height * .1,
      margin: EdgeInsets.only(top: height * .07),
      child: RaisedButton(
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => login(userWatch, context, projectWatch),
      ),
    );
  }
}
