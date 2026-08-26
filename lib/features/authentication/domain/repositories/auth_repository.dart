import '../../../admin/data/models/user_model.dart';
import '../../../../core/error/result.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> login({
    required String email,
    required String password,
  });
  Future<Result<void>> logout();
  Future<Result<UserModel>> getCurrentUser();
  Future<bool> isLoggedIn();
  Future<String?> getUserRole();
  Future<int?> getUserId();
}
