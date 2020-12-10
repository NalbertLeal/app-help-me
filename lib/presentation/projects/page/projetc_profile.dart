import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../providers/project_provider.dart';
import '../../../utils/navigation.dart';
import '../../../domain/use_cases/logout.dart';
import '../../../data/repositories/user_repository.dart';

class ProjectProfilePage extends HookWidget {
  static final String route = '/project-profile';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigation().goBack();
        },
      ),
      actions: [
        FlatButton(
          color: Colors.white,
          child: Text(
            'Logout',
          ),
          onPressed: () {
            Logout(UserRepository()).execute();
            Navigation().navigatoTo('/');
          },
        ),
      ],
    );

    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            // height: height,
            child: Column(children: [
              Container(
                width: width * .8,
                margin:
                    EdgeInsets.only(top: height * .04, bottom: height * .04),
                child: Text(
                  'Projeto 1',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                width: width * .8,
                margin: EdgeInsets.only(bottom: height * .04),
                child: Text(
                  lorem(paragraphs: 3, words: 150),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: width * .37,
                    ),
                    FlutterLogo(
                      size: width * .37,
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .8,
                child: Text(
                  'Nosso endereço é:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: width * .8,
                margin: EdgeInsets.only(bottom: height * .04),
                child: Text(
                  'Parnamirim, Nova Parnamirim, Rua dos pintasilgos, Nº 12345',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: width * .8,
                margin: EdgeInsets.only(bottom: height * .04),
                child: RaisedButton(
                  child: Text(
                    'Doar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Infelizmente essa funcionalidade está sendo implementada.',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
