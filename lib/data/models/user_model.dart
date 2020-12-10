import '../../domain/entities/user.dart';

class UserModel extends User {
  
  UserModel({
    String userId,
    String name,
    String email,
    String password,
    List<String> projectsOwnerships,
  }) : super(
    userId: userId,
    name: name,
    email: email,
    password: password,
    projectsOwnerships: projectsOwnerships,
  );

  UserModel.fromMap(Map m) : super(
    userId: m['userId'],
    name: m['name'],
    email: m['email'],
    password: m['password'],
    projectsOwnerships: m['projectsOwnerships'],
  );

  Map toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'projectsOwnerships': projectsOwnerships,
    };
  }
}