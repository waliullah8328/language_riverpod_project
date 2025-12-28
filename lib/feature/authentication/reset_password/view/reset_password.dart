import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';

import '../../../../core/common/widgets/custom_text.dart';

import '../../../../core/common/widgets/new_custon_widgets/custom_password_text_field.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/theme/theme_provider.dart';
import '../../../../core/utils/validators/app_validator.dart';
import '../view_model/reset_password_view_model.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen( {super.key,required this.email,required this.otp,});

  final String email;
  final String otp;

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends ConsumerState<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();

  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {


    final themeMode = ref.watch(themeModeProvider);

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            brightness == Brightness.dark);

    return Scaffold(
      resizeToAvoidBottomInset: false,


      /// ================= APP BAR =================
      appBar: AppBar(

        elevation: 0,
        title: Text(
          "Reset Password",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      /// ================= BOTTOM BUTTON =================
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1),

            Consumer(
              builder: (context, ref, _) {
                // final isLoading = ref.watch(
                //   resetPasswordProvider.select((s) => s.isLoading),
                // );

                return Padding(
                  padding:
                  EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                  child: CustomPrimaryButton(
                    title: "Save New Password",
                    onPressed: () {
                      if (_resetPasswordFormKey.currentState!.validate()) {

                        debugPrint("----------------------------------------------------------");
                        debugPrint(widget.email.toString());
                        debugPrint(widget.otp.toString());
                        debugPrint("----------------------------------------------------------");
                        context.go(RouteNames.signUpScreen);



                        // final result = await ref
                        //     .read(resetPasswordProvider.notifier)
                        //     .resetPassword(
                        //   context: context,
                        //   email: email,
                        //   newPassword: _newPasswordController.text.toString(),
                        //   confirmPassword: _confirmPasswordController.text.toString()
                        // );
                        //
                        // if (!context.mounted) return;
                        //
                        // final state =
                        // ref.read(resetPasswordProvider);
                        //
                        // if (result) {
                        //   Navigator.pushNamed(
                        //     context,
                        //     RouteNames.resetSuccessScreen,
                        //   );
                        //
                        //   AppSnackBar.showSuccess(
                        //     context,
                        //     state.successMessage,
                        //     title: _getText(AppLocale.success,
                        //         currentLangCode),
                        //   );
                        // } else {
                        //   AppSnackBar.showError(
                        //     context,
                        //     state.errorMessage,
                        //     title: _getText(AppLocale.error,
                        //         currentLangCode),
                        //   );
                        // }
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),

      /// ================= BODY =================
      body: Form(
        key: _resetPasswordFormKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Secure Your Account",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                CustomText(
                  text: "Choose a new password for your Step Quest account. Make sure it's secure and easy to remember.",
                  color: isDarkMode
                      ? AppColors.textWhite
                      : AppColors.textGrey,
                  fontSize: 14.sp,
                ),

                SizedBox(height: 30.h),

                /// ---------- NEW PASSWORD ----------
                CustomText(
                  text: "New Password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8.h),

                Consumer(
                  builder: (context, ref, _) {
                    final isShowPassword = ref.watch(
                      resetPasswordProvider
                          .select((s) => s.isShowPassword),
                    );

                    return CustomPasswordTextField(
                      controller: _newPasswordController,
                      isDarkMode: isDarkMode,
                      obscureText: !isShowPassword,
                      validator: AppValidator.validatePassword,
                      hintText:"New Password",
                      suffixIcon: IconButton(
                        icon: Icon(isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => ref
                            .read(resetPasswordProvider.notifier)
                            .togglePasswordVisibility(),
                      ),
                      prefixIcon: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.passwordIcon,
                            colorFilter: isDarkMode
                                ? const ColorFilter.mode(
                              AppColors.textWhite,
                              BlendMode.srcIn,
                            )
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 16.h),

                /// ---------- CONFIRM PASSWORD ----------
                CustomText(
                  text: "Confirm New Password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8.h),

                Consumer(
                  builder: (context, ref, _) {
                    final isShowPassword = ref.watch(
                      resetPasswordProvider
                          .select((s) => s.isShowPassword1),
                    );

                    return CustomPasswordTextField(
                      controller: _confirmPasswordController,
                      isDarkMode: isDarkMode,
                      obscureText: !isShowPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm Password is required";
                        }
                        if (value !=
                            _newPasswordController.text) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      hintText: "Confirm New Password",
                      suffixIcon: IconButton(
                        icon: Icon(isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => ref
                            .read(resetPasswordProvider.notifier)
                            .toggleConfirmPasswordVisibility(),
                      ),
                      prefixIcon: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.passwordIcon,
                            colorFilter: isDarkMode
                                ? const ColorFilter.mode(
                              AppColors.textWhite,
                              BlendMode.srcIn,
                            )
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
