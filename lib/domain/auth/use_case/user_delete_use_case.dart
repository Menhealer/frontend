import 'package:relog/domain/auth/model/user_delete_request.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

class UserDeleteUseCase {
  final AuthRepository _authRepository;
  UserDeleteUseCase(this._authRepository);

  Future<bool> execute(UserDeleteRequest request) async {
    return await _authRepository.userDelete(request);
  }
}