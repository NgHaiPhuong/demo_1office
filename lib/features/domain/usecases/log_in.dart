import '../../data/models/user.dart';
import '../repositories/user_repository.dart';

class LogInUserCase {
  final UserRepository repository;

  LogInUserCase(this.repository);

  Future<UserModel> call(String email, String password) async {
    return await repository.login(email, password);
  }
}