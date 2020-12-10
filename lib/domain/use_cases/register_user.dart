import '../entities/user.dart';
import '../repositories/Iuser_repository.dart';

class RegisterUser {
  IUserRepository userRepository;
  
  RegisterUser(this.userRepository);

  Future<void> execute(User user) async {
    await userRepository.setNewUser(user);
  }
}