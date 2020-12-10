import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_provider.dart';

class PasswordField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userWatch = watch(userProvider);
    
    return TextFormField(
      maxLengthEnforced: true,
      maxLength: 20,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha'
      ),
      onChanged: (newPassword) => userWatch.updatePassword(newPassword),
      validator: (_) => userWatch.isPasswordValid ? null : 'max de 20 chars com apenas letras ou numeros',
    );
  }
}