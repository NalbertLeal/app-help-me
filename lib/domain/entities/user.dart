import 'package:equatable/equatable.dart';

import './value_objects/email.dart';
import './value_objects/password.dart';

class User extends Equatable {
  final String userId;
  final String name;
  final Email _email;
  final Password _password;
  final List<String> projectsOwnerships;

  User({
    this.userId,
    this.name,
    String email,
    String password,
    this.projectsOwnerships,
  })  : this._email = Email(email),
        this._password = Password(password);

  String get email {
    return _email.email;
  }
  
  String get password {
    return _password.password;
  }

  @override
  List<Object> get props => [email];
}
