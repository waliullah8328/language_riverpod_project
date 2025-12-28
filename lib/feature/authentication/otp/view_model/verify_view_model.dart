import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

import 'package:language_riverpod_project/feature/authentication/otp/view_model/verify_otp_state.dart';




final otpNotifierProvider = StateNotifierProvider<OtpNotifier, OtpState>((ref) {

  return OtpNotifier();
});
class OtpNotifier extends StateNotifier<OtpState> {


  OtpNotifier()
      : super(OtpState(
  )) {
    _startResendCodeTimer();
  }

  void setOtp(String value) => state = state.copyWith(otp: value);

  Timer? _timer;

  void _startResendCodeTimer() {
    _timer?.cancel();
    state = state.copyWith(enableResend: false, remainingTime: 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (state.remainingTime == 0) {
        t.cancel();
        state = state.copyWith(enableResend: true);
      } else {
        state = state.copyWith(remainingTime: state.remainingTime - 1);
      }
    });
  }

  // Future<bool> verifyOtp({required BuildContext context,required String email}) async {
  //
  //
  //
  //
  //   state = state.copyWith(isLoading: true, errorMessage: null);
  //
  //   try {
  //     final response = await AuthenticationRepository().otpVerify(
  //       email:email,
  //       otp: state.otp.toString()
  //
  //     );
  //
  //     debugPrint("Verify Otp response: $response");
  //
  //
  //     if (response['success'] == true) {
  //       state = state.copyWith(isLoading: false,errorMessage: null,successMessage:response['message'] );
  //
  //
  //
  //       //notifyListeners(); // Notify UI of successful signup
  //       return true;
  //     } else {
  //       // Handle specific error messages from the API
  //       final error = response['error'] ?? response['message'];
  //
  //
  //       state = state.copyWith(isLoading: false,errorMessage: error);
  //
  //
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint("Verify Otp exception: $e");
  //
  //     state = state.copyWith(isLoading: false,errorMessage: e.toString());
  //     // Notify UI of exception
  //     return false;
  //   }
  //
  //
  // }
  //
  //
  //
  // Future<bool> resendEmail({
  //   required BuildContext context,
  //   required String email,
  // }) async {
  //   state = state.copyWith(
  //     isResendLoading: true,
  //     errorMessage: null,
  //     successMessageOne: null,
  //   );
  //
  //   try {
  //     final response = await AuthenticationRepository().forgetPassword(
  //       email: email,
  //     );
  //
  //     debugPrint("📩 Resend email response: $response");
  //
  //     // ✅ Success
  //     if (response['success'] == true) {
  //       _startResendCodeTimer();
  //
  //       state = state.copyWith(
  //         isResendLoading: false,
  //         errorMessageOne: null,
  //         successMessageOne: response['message'] ?? 'OTP sent successfully',
  //       );
  //
  //       return true;
  //     }
  //
  //     // ❌ API-level error
  //     final errorMessage =
  //         response['error'] ??
  //             response['message'] ??
  //             'Failed to resend OTP';
  //
  //     state = state.copyWith(
  //       isResendLoading: false,
  //       errorMessageOne: errorMessage,
  //     );
  //
  //     return false;
  //   }
  //
  //   // ❌ Unexpected error
  //   catch (e) {
  //     debugPrint("❌ Resend email exception: $e");
  //
  //     state = state.copyWith(
  //       isResendLoading: false,
  //       errorMessageOne: 'Something went wrong. Please try again.',
  //     );
  //
  //     return false;
  //   }
  // }




  @override
  void dispose() {
    _timer?.cancel();
    state.otp;
    super.dispose();
  }
}


