import 'package:help_me/data/repositories/user_repository.dart';
import '../entities/user.dart';
import '../repositories/Iuser_repository.dart';

class Logout {
  IUserRepository userRepository;
  
  Logout(this.userRepository);

  void execute() {
    userRepository.logout();
  }
}