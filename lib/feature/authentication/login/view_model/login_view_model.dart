
import 'package:flutter_riverpod/legacy.dart';

import 'package:shared_preferences/shared_preferences.dart';



import 'login_state.dart';



class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState(email: '', password: '', termsAccepted: false, isSubmitting: false)) {
    loadRememberedLogin(); // <-- Load saved email & password
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void toggleTermsAccepted() async {
    state = state.copyWith(termsAccepted: !state.termsAccepted);




  }


  // ------------------------------
  // REMEMBER ME  SAVE/LOAD
  // ------------------------------
  Future<void> loadRememberedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('remember_email');
    final savedPassword = prefs.getString('remember_password');
    final savedRemember = prefs.getBool('remember_me') ?? false;

    if (savedRemember && savedEmail != null && savedPassword != null) {
      state = state.copyWith(
        email: savedEmail,
        password: savedPassword,
        termsAccepted: savedRemember,
      );
    }
  }

  Future<void> saveRememberedLogin() async {
    final prefs = await SharedPreferences.getInstance();


      await prefs.setString('remember_email', state.email);
      await prefs.setString('remember_password', state.password);
      await prefs.setBool('remember_me', true);

  }

  Future<void> clearSavedLogin() async {
    final prefs = await SharedPreferences.getInstance();


      await prefs.remove('remember_email',);
      await prefs.remove('remember_password');
      await prefs.setBool('remember_me', false);

  }

  // Future<bool> submitLogin({required BuildContext context}) async {
  //
  //   debugPrint(state.email);
  //   debugPrint(state.password);
  //
  //   state = state.copyWith(isLoading: true, errorMessage: null);
  //
  //   try {
  //     final response = await AuthenticationRepository().login(
  //         email:state.email,
  //         password: state.password
  //     );
  //
  //     debugPrint("Login response: $response");
  //
  //
  //     if (response['success'] == true) {
  //       state = state.copyWith(isLoading: false,errorMessage: null);
  //       final prefs = await SharedPreferences.getInstance();
  //       if (!state.termsAccepted) {
  //         // Remove saved login immediately
  //
  //         await prefs.remove('remember_email');
  //         await prefs.remove('remember_password');
  //         await prefs.setBool('remember_me', false);
  //
  //         // Update state to clear email/password
  //         state = state.copyWith(email: '', password: '');
  //       } else {
  //         await prefs.setBool('remember_me', true);
  //       }
  //       state = state.copyWith(isLoading: false,errorMessage: null,successMessage: response['message']);
  //
  //       //AppSnackBar.showSuccess(context, "User login successfully");
  //
  //       // Check if tokens were received and stored
  //       if (response['data'] != null && response['data']['tokens'] != null) {
  //         final tokens = response['data']['tokens'];
  //         debugPrint("Get Access Token : $tokens");
  //         final refreshToken = response['data']['refreshToken'];
  //         debugPrint("Get Refresh Token : $refreshToken");
  //
  //         final user = response['data']["user"];
  //         final stepGoal = user['step_goal'];
  //
  //         debugPrint("Get User Step Goal : $stepGoal");
  //         if(response['data']['user']['signup_completed']){
  //           // Store tokens in SharedPreferences
  //           await TokenStorage.saveTokens(
  //             accessToken: tokens,
  //             refreshToken: refreshToken,
  //           );
  //           final getAccessToken = await TokenStorage.getAccessToken();
  //           debugPrint("Get SaveAccess Token : $getAccessToken");
  //           await TokenStorage.saveUserData(
  //             userId: user['id'],
  //             email: user['email'],
  //             userRole:user['role'],
  //             userGoal: user['step_goal'].toString()
  //           );
  //           final socketService = PresenceSocketService();
  //
  //           socketService.connect(tokens,);
  //
  //
  //
  //
  //         }else{
  //           final tokens = response['data']['tokens'];
  //           Navigator.pushReplacementNamed(context, RouteNames.onboardingPage,arguments: {
  //             'token':tokens,
  //           });
  //         }
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
  //       // Register FCM token after successful sign in
  //       try {
  //         // await FCMService().registerFCMToken();
  //         debugPrint("FCM token registered successfully after sign in");
  //       } catch (fcmError) {
  //         debugPrint("FCM token registration failed after sign in: $fcmError");
  //         // Don't fail the sign in process if FCM registration fails
  //       }
  //
  //
  //       return true;
  //     } else {
  //       // Handle specific error messages from the API
  //       final error = response['error'] ?? response['message'];
  //
  //
  //       state = state.copyWith(isLoading: false,errorMessage: error);
  //
  //       // Notify UI of error
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

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});