import 'models/models.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;
  Future<void> signIn(String email, String password);
  Future<MyUser> signUp(MyUser user, String password);
  Future<void> setUserData(MyUser user);
  Future<void> logout();
}