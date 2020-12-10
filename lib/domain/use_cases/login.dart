import 'package:help_me/data/repositories/user_repository.dart';
import '../entities/user.dart';
import '../repositories/Iuser_repository.dart';

class Login {
  IUserRepository userRepository;
  
  Login(this.userRepository);

  Future<User> execute(User user) async {
    return await userRepository.login(user);
  }
}