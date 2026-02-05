import 'package:relog/domain/auth/model/login_response.dart';
import 'package:relog/domain/auth/model/sign_up_request.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future<LoginResponse> execute(SignUpRequest request) async {
    return await _authRepository.signUp(request);
  }
}