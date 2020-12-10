import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_provider.dart';

class EmailField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userWatch = watch(userProvider);
    
    return TextFormField(
      maxLengthEnforced: true,
      maxLength: 60,
      decoration: InputDecoration(
        labelText: 'Email'
      ),
      onChanged: (newEmail) => userWatch.updateEmail(newEmail),
      validator: (_) => userWatch.isEmailValid ? null : 'max de 60 chars no formato \'email@provedor.com\'',
    );
  }
}