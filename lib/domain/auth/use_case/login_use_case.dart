import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/login_response.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<LoginResponse> execute(LoginRequest request) async {
    return await _authRepository.login(request);
  }
}