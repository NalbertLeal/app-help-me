import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import '../../exceptions/no_user_authenticated.dart';
import '../../exceptions/no_user_found.dart';
import '../../exceptions/user_already_exists.dart';

class UserLocalDataSource {
  static List<UserModel> users = [];

  UserModel findUser(String email) {
    for (int i = 0; i < UserLocalDataSource.users.length; i++) {
      final shouldIntoResult = UserLocalDataSource.users[i].email == email;
      if (shouldIntoResult) {
        return UserLocalDataSource.users[i];
      }
    }
    return null;
  }

  Future<bool> get isAuthenticated async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.getString('currentUser');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<User> get getCurrentUser async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final currentUser = sharedPreferences.getString('currentUser');
      final Map userJson = jsonDecode(currentUser);
      return UserModel.fromMap(userJson);
    } catch (_) {
      throw NoUserAuthenticated();
    }
  }

  Future<User> login(User user) async {
    try {
      final userFound = findUser(user.email);
      if (user == null) throw Error();

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      
      if ((sharedPreferences.getString('currentUser') ?? '').isNotEmpty) throw Error();

      sharedPreferences.setString('currentUser', jsonEncode(userFound.toMap()));

      return userFound;
    } catch (_) {
      throw NoUserFound();
    }
  }

  Future<void> logout() async {
    if (!await this.isAuthenticated) throw NoUserAuthenticated();

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('currentUser');
  }

  Future<void> setNewUser(User user) async {
    final userFound = this.findUser(user.email);
    if (userFound != null) {
      print('ja existe');
      throw UserAlreadyExists();
    }

    UserModel userModel = UserModel(
      userId: '${UserLocalDataSource.users.length}-${user.email}',
      name: user.name,
      email: user.email,
      password: user.password,
      projectsOwnerships: user.projectsOwnerships,
    );

    UserLocalDataSource.users.add(userModel);

    // UserLocalDataSource.saveUsers();

    return userModel;
  }
}
