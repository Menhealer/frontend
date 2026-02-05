import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/sign_in/sign_in_state.dart';
import 'package:relog/presentation/sign_in/sign_in_view_model.dart';

final signInViewModelProvider = NotifierProvider<SignInViewModel, SignInState>(
  SignInViewModel.new,
);