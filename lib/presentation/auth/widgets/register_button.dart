import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/user_provider.dart';
import '../../../exceptions/user_already_exists.dart';
import '../../../utils/navigation.dart';
import '../../projects/page/find_projects.dart';
import '../../projects/providers/project_provider.dart';

class RegisterButton extends HookWidget {
  final GlobalKey<FormState> globalKey;
  final bool aceptedTerms;

  RegisterButton({
    this.globalKey,
    this.aceptedTerms,
  });

  Future<void> register(UserProvider userWatch, BuildContext context, ProjectProvider projectWatch) async {
    try {
      await userWatch.register(globalKey);
      projectWatch.usuarioLogado = true;
      Navigation().navigatoTo(FindProjectPage.route);
    } on UserAlreadyExists {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario já existe!'),
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
      child: RaisedButton(
        child: const Text(
          'Registrar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: aceptedTerms ? (() => register(userWatch, context,projectWatch)) : null,
      ),
    );
  }
}
