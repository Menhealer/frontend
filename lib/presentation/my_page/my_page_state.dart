class MyPageState {
  final bool isLoading;
  final String? errorMessage;

  MyPageState({
    required this.isLoading,
    this.errorMessage,
  });

  MyPageState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return MyPageState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}