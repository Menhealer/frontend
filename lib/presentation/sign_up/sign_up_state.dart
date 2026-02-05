class SignUpState {
  final bool isLoading;
  final String? errorMessage;

  SignUpState({
    required this.isLoading,
    this.errorMessage,
  });

  SignUpState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}