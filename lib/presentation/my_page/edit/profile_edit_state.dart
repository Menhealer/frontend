class ProfileEditState {
  final bool isLoading;
  final String? errorMessage;

  ProfileEditState({
    required this.isLoading,
    this.errorMessage,
  });

  ProfileEditState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProfileEditState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}