import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/sign_up/sign_up_state.dart';
import 'package:relog/presentation/sign_up/sign_up_view_model.dart';

final signUpViewModelProvider = NotifierProvider<SignUpViewModel, SignUpState>(
  SignUpViewModel.new,
);