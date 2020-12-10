import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/value_objects/email.dart';
import '../../../domain/entities/value_objects/password.dart';
import '../../../domain/use_cases/login.dart';
import '../../../domain/use_cases/register_user.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../domain/entities/user.dart';
import '../../../exceptions/invalid_user_credention.dart';

final userProvider = Provider((ref) => UserProvider());

class UserProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';

  updateName(String newName) {
    name = newName;
  }

  updateEmail(String newEmail) {
    email = newEmail;
  }

  updatePassword(String newPassword) {
    password = newPassword;
  }

  bool get isEmailValid {
    return Email(email).isValid;
  }

  bool get isPasswordValid {
    return Password(password).isValid;
  }

  Future<void> login(GlobalKey<FormState> formKey) async {
    bool isFormValid = formKey.currentState.validate();
    print(isFormValid);
    if (!isFormValid) throw InvalidUserCredention();

    final login = Login(UserRepository());

    final user = User(
      email: email,
      password: password,
    );
    await login.execute(user);
    name = '';
    email = '';
    password = '';
  }

  Future<void> register(GlobalKey<FormState> formKey) async {
    bool isFormValid = formKey.currentState.validate();
    if (!isFormValid)  throw InvalidUserCredention();
    final registerUser = RegisterUser(UserRepository());

    final user = User(
      name: name,
      email: email,
      password: password,
    );

    await registerUser.execute(user);
    name = '';
    email = '';
    password = '';
  }
}
