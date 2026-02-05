class SignInState {
  final bool isLoading;
  final String? errorMessage;

  SignInState({
    required this.isLoading,
    this.errorMessage,
  });

  SignInState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}