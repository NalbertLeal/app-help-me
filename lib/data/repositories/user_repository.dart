import '../../domain/entities/user.dart';
import '../../domain/repositories/Iuser_repository.dart';
import '../data_sources/user_local_data_source.dart';

class UserRepository extends IUserRepository {
  final userLocalDataSource = UserLocalDataSource();

  Future<bool> get isAuthenticated {
    return userLocalDataSource.isAuthenticated;
  }

  Future<User> get getCurrentUser async {
    return await userLocalDataSource.getCurrentUser;
  }
  
  Future<User> login(User user) async {
    return await userLocalDataSource.login(user);
  }

  Future<void> logout() async {
    await userLocalDataSource.logout();
  }

  Future<void> setNewUser(User user) async  {
    await userLocalDataSource.setNewUser(user);
    return null;
  }
}