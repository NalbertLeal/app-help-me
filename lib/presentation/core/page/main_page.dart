import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/navigation.dart';
import '../../projects/page/find_projects.dart';
import '../../projects/providers/project_provider.dart';

class MainPage extends HookWidget {
  void showLoginOrRegisterModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          final double height = MediaQuery.of(ctx).size.height -
              MediaQuery.of(context).padding.top;
          final double width = MediaQuery.of(ctx).size.width;

          return Container(
            height: height,
            width: width,
            child: Container(
              height: height * .5,
              width: width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * .8,
                    height: height * .15,
                    padding: EdgeInsets.only(bottom: height * .05),
                    child: RaisedButton(
                      child: Text(
                        'Já tenho uma conta',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigation().navigatoTo('/login');
                      },
                    ),
                  ),
                  Container(
                    width: width * .8,
                    height: height * .1,
                    child: RaisedButton(
                      child: Text(
                        'Criar minha conta',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigation().navigatoTo('/resgister-user');
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final project = useProvider(projectProvider);
    
    // useEffect(() {
    //   project.usuarioLogado = false;
    // });

    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Help Me',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: height * .1,
              ),
              Container(
                width: width * .8,
                height: height * .1,
                margin: EdgeInsets.only(bottom: height * .05),
                child: RaisedButton(
                  child: Text(
                    'Login / Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    showLoginOrRegisterModal(context);
                  },
                ),
              ),
              Container(
                width: width * .8,
                height: height * .1,
                child: RaisedButton(
                  child: Text(
                    'Encontrar projetos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigation().navigatoTo(FindProjectPage.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
