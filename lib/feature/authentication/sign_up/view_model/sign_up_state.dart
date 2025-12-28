

class SignUpState {
  final String email;
  final String password;
  final bool termsAccepted;
  final bool isSubmitting;
  final String errorMessage;
  final bool isLoading;
  final String successMessage;
  final bool isShowPassword;

  SignUpState({
     this.email = '',
     this.password = '',
    this.termsAccepted = false,
     this.isSubmitting = false,
    this.errorMessage = '',
    this.isLoading = false,
    this.successMessage = '',
    this.isShowPassword = false,
  });

  SignUpState copyWith({
    String? email,
    String? password,
    bool? termsAccepted,
    bool? isSubmitting,
    String? errorMessage,
    bool? isLoading,
    String? successMessage,
    bool? isShowPassword,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading??this.isLoading,
      successMessage: successMessage??this.successMessage,
      isShowPassword: isShowPassword??  this.isShowPassword,
    );
  }
}


