import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:language_riverpod_project/feature/authentication/reset_password/view_model/reset_password_state.dart';


class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier() : super(ResetPasswordState());

  void updateNewPassword(String value) {
    state = state.copyWith(newPassword: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(isShowPassword1: !state.isShowPassword1);
  }

  // Future<bool> resetPassword({required BuildContext context,required String email,required String newPassword, required String confirmPassword}) async {
  //
  //
  //
  //
  //   state = state.copyWith(isLoading: true, errorMessage: null);
  //
  //   try {
  //     final response = await AuthenticationRepository().resetPassword(
  //         email:email,
  //         confirmPassword: confirmPassword,
  //        newPassword: newPassword
  //
  //     );
  //
  //     debugPrint("Reset password response: $response");
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
  //     debugPrint("Reset password exception: $e");
  //
  //     state = state.copyWith(isLoading: false,errorMessage: e.toString());
  //     // Notify UI of exception
  //     return false;
  //   }
  //
  //
  // }




}

final resetPasswordProvider = StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  return ResetPasswordNotifier();
});