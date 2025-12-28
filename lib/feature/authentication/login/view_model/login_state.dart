

class LoginState {
   String email;
  String password;
   bool termsAccepted;
   bool isSubmitting;
   String errorMessage;
   bool isLoading;
  String successMessage;

  LoginState({
    this.email = '',
    this.password = '',
    this.termsAccepted = false,
    this.isSubmitting = false,
    this.errorMessage = '',
    this.isLoading = false,
  this.successMessage = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? termsAccepted,
    bool? isSubmitting,
    String? errorMessage,
    bool? isLoading,
    String? successMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading??this.isLoading,
      successMessage: successMessage??this.successMessage,
    );
  }
}


