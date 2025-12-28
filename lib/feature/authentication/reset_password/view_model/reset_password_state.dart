class ResetPasswordState{
  final String newPassword;
  final String confirmPassword;
  final String errorMessage;
  final bool isLoading;
  final String successMessage;
  final bool isShowPassword;
  final bool isShowPassword1;



  ResetPasswordState({
    this.newPassword = '',
    this.confirmPassword = '',
    this.errorMessage = '',
    this.isLoading = false,
    this.successMessage = '',
    this.isShowPassword = false,
    this.isShowPassword1 = false,
});
  ResetPasswordState copyWith ({
     String? newPassword,
    String? confirmPassword,
    String? errorMessage,
    bool? isLoading,
    String? successMessage,
    bool? isShowPassword,
    bool? isShowPassword1,

}){
    return ResetPasswordState(
      newPassword: newPassword?? this.newPassword,
      confirmPassword: confirmPassword?? this.confirmPassword,
      errorMessage: errorMessage?? this.errorMessage,
      isLoading: isLoading?? this.isLoading,
      successMessage: successMessage??this.successMessage,
      isShowPassword: isShowPassword?? this.isShowPassword,
      isShowPassword1: isShowPassword1??this.isShowPassword1,

    );

}
}