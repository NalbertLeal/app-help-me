import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/donate_provider.dart';
import '../../../exceptions/project_not_found.dart';

class DonatePage extends HookWidget {
  static final String route = '/find-project';

  Function donate(DonateProvider projectWatch, BuildContext context) {
    return () {
      try {
        projectWatch.makeDonation();
      } on ProjectNotFound {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('projeto não encontrado'),
          ),
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final isTermsAcepted = useState(false);
    final donateWatch = useProvider(donateProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Preencha os dados a respeito do projeto e ajude pessoas!'),
              TextFormField(
                maxLength: 50,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  labelText: 'Nome do projeto',
                ),
              ),
              TextFormField(
                maxLength: 1000,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  labelText: 'Categorias do projeto',
                ),
              ),
              TextFormField(
                maxLength: 10000,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  labelText: 'Descrição do projeto',
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isTermsAcepted.value,
                    onChanged: (newValue) => isTermsAcepted.value = newValue,
                  ),
                  Text("Aceito os termos"),
                ],
              ),
              RaisedButton(
                child: Text('Registrar'),
                onPressed: donate(donateWatch, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
