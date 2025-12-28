class OtpState {
   String otp;
  bool isLoading;
  bool isResendLoading;
  bool enableResend;
  int remainingTime;
   String errorMessage;
   String successMessage;
   String successMessageOne;
   String errorMessageOne;


  OtpState({
     this.otp ='',
    this.isLoading = false,
    this.enableResend = false,
    this.remainingTime = 60,
    this.errorMessage = '',
    this.isResendLoading = false,
    this.successMessage = '',
    this.successMessageOne = '',
    this.errorMessageOne = '',

  });

  OtpState copyWith({
    String? otp,
    bool? isLoading,
    bool? enableResend,
    int? remainingTime,
    String? errorMessage,
    bool? isResendLoading,
    String? successMessage,
    String? successMessageOne,
    String? errorMessageOne,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      isLoading: isLoading ?? this.isLoading,
      enableResend: enableResend ?? this.enableResend,
      remainingTime: remainingTime ?? this.remainingTime,
      errorMessage: errorMessage??this.errorMessage,
      isResendLoading: isResendLoading??this.isResendLoading,
      successMessage: successMessage??this.successMessage,
      successMessageOne: successMessageOne??this.successMessageOne,
      errorMessageOne: errorMessageOne??this.errorMessageOne
    );
  }
}