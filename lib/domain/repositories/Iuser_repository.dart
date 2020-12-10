import '../entities/user.dart';

abstract class IUserRepository {
  Future<bool> get isAuthenticated;
  Future<User> get getCurrentUser;
  Future<User> login(User user);
  Future<void> logout();
  Future<void> setNewUser(User user);
}