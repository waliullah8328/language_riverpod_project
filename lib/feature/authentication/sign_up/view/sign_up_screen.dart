import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';


import '../../../../core/common/widgets/custom_text.dart';

import '../../../../core/common/widgets/new_custon_widgets/custom_check_box_widget.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_password_text_field.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/new_custon_widgets/social_login.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/theme/theme_provider.dart';
import '../../../../core/utils/validators/app_validator.dart';

import '../view_model/sign_up_view_model.dart';

// ✅ MUST BE Stateful
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && brightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Sign Up",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 10.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
          ),
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join Step Quest Today",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),

                CustomText(
                  text:"Create your account and start tracking your steps.",
                  color: isDarkMode ? AppColors.textWhite : AppColors.textGrey,
                  fontSize: 13.sp,
                ),

                SizedBox(height: 30.h),
                // Email
                CustomText(
                  text: "Email",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "Email",
                  onChanged: (email) =>
                      ref.read(signUpProvider.notifier).updateEmail(email),
                  prefixIcon: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.emailIcon,
                        colorFilter: isDarkMode
                            ? const ColorFilter.mode(
                          AppColors.textWhite,
                          BlendMode.srcIn,
                        )
                            : null,
                      ),
                    ),
                  ),

                  validator: AppValidator.validateEmail,
                ),

                /// 🔐 PASSWORD FIELD (FIXED)
                CustomText(
                  text: "Password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                Consumer(
                  builder: (context, ref, _) {
                    final isShowPassword = ref.watch(
                      signUpProvider.select((s) => s.isShowPassword),
                    );

                    return CustomPasswordTextField(
                        isDarkMode: isDarkMode,
                        obscureText: !isShowPassword,
                        validator:  AppValidator.validatePassword,
                        hintText: "Password",
                        onChanged: (password) =>
                            ref.read(signUpProvider.notifier).updatePassword(password),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isShowPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: isDarkMode
                                ? AppColors.textWhite
                                : AppColors.textGrey,
                          ),
                          onPressed: () {
                            ref
                                .read(signUpProvider.notifier)
                                .togglePasswordVisibility();
                            // keeps keyboard open
                          },
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


                Row(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final accepted = ref.watch(
                          signUpProvider.select((s) => s.termsAccepted),
                        );
                        return CustomCheckBoxWidget(
                          value: accepted,
                          onChanged: (value) => ref
                              .read(signUpProvider.notifier)
                              .toggleTermsAccepted(),
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    RichText(
                      text: TextSpan(
                        text:
                            "I agree to ",
                        style: TextStyle(
                          color: isDarkMode
                              ? AppColors.textWhite
                              : AppColors.textGrey,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions.",
                            style: TextStyle(color: Color(0xff16A8AD)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        context.push(RouteNames.loginScreen);
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff16A8AD),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(height: 1.h, color: Color(0xffEEEEEE)),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "or",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Divider(height: 1.h, color: Color(0xffEEEEEE)),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),


                CustomSocialLogin(
                  title: "Continue with Google",
                  iconPath: IconPath.googleSignInIcon,
                  onTap: () {},
                ),

                SizedBox(height: 15.h),

                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w,color: Color(0xffEEEEEE)),
                        borderRadius: BorderRadius.circular(99)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconPath.appleSignInIcon,
                          colorFilter: isDarkMode
                              ? const ColorFilter.mode(
                            AppColors.textWhite,
                            BlendMode.srcIn,
                          )
                              : null,
                        ),
                        Expanded(child: Center(child: CustomText(text: "Continue with Apple",fontSize: 16.sp,fontWeight: FontWeight.w600,)))

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h,),

                /// ✅ SIGN UP BUTTON
                Consumer(
                  builder: (context, ref, _) {
                    final email = ref.watch(signUpProvider.select((s)=>s.email));


                    return CustomPrimaryButton(
                      title:"Sign up",
                      onPressed: () async {
                        if (_signUpFormKey.currentState!.validate()) {
                          context.push("${RouteNames.otpScreen}/$email");

                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
