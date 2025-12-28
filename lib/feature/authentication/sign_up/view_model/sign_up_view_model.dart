
import 'package:flutter_riverpod/legacy.dart';

import 'package:language_riverpod_project/feature/authentication/sign_up/view_model/sign_up_state.dart';






final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {

  return SignUpNotifier();
});

class SignUpNotifier extends StateNotifier<SignUpState> {


  SignUpNotifier() : super(SignUpState(email: '', password: '', termsAccepted: false, isSubmitting: false,isLoading: false));

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
  void togglePasswordVisibility() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  void toggleTermsAccepted() {
    state = state.copyWith(termsAccepted: !state.termsAccepted);
  }

  // Future<bool> createAccount({required BuildContext context}) async {
  //
  //   debugPrint(state.email);
  //   debugPrint(state.password);
  //
  //   state = state.copyWith(isLoading: true, errorMessage: null);
  //
  //   try {
  //     final response = await AuthenticationRepository().signup(
  //       email:state.email,
  //      password: state.password
  //     );
  //
  //     debugPrint("Signup response: $response");
  //
  //
  //     if (response['success'] == true) {
  //       state = state.copyWith(isLoading: false,errorMessage: null,successMessage: response['message']);
  //
  //       // Check if tokens were received and stored
  //       if (response['data'] != null && response['data']['tokens'] != null) {
  //         final tokens = response['data']['tokens'];
  //         debugPrint("Get Access Token : $tokens");
  //         final refreshToken = response['data']['refreshToken'];
  //         debugPrint("Get Refresh Token : $refreshToken");
  //
  //         Navigator.pushReplacementNamed(context, RouteNames.onboardingPage,arguments: {
  //           'token':tokens,
  //         });
  //
  //
  //
  //
  //         debugPrint("User login successfully with tokens stored");
  //         debugPrint("User data: ${response['data']['user']}");
  //         debugPrint("User data: ${response['data']['user']['signup_completed']}");
  //       } else {
  //         debugPrint("User login successfully (legacy format)");
  //       }
  //
  //       // Register FCM token after successful signup
  //       try {
  //        // await FCMService().registerFCMToken();
  //         debugPrint("FCM token registered successfully after signup");
  //       } catch (fcmError) {
  //         debugPrint("FCM token registration failed after signup: $fcmError");
  //         // Don't fail the signup process if FCM registration fails
  //       }
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
  //      // Notify UI of error
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint("Signup exception: $e");
  //
  //     state = state.copyWith(isLoading: false,errorMessage: e.toString());
  //     // Notify UI of exception
  //     return false;
  //   }
  //
  //
  // }





}

