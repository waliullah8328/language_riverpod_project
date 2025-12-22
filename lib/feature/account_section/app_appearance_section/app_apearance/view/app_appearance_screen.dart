import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../../../../core/common/widgets/new_custon_widgets/custom_secondary_button.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../../core/utils/theme/theme_provider.dart';
import '../../../../language/language.dart';
import '../../language/view/language_section_screen.dart';

class AppAppearanceScreen extends ConsumerWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build Called");

    final themeMode = ref.watch(themeModeProvider);
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);
    final language = ref.watch(languageProvider);

    String getThemeLabel() {
      switch (themeMode) {
        case ThemeMode.light:
          return "Light Mode";
        case ThemeMode.dark:
          return "Dark Mode";
        default:
          return "System Default";
      }
    }

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xff212121) : const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color(0xff212121) : const Color(0xffF5F5F5),
        title: Text(
          "App Appearance",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              trailing: IntrinsicWidth(
                child: Row(
                  children: [
                    Text(getThemeLabel(),
                        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      IconPath.rightArrowIcon,
                      height: 20.h,
                      width: 20.w,
                    )
                  ],
                ),
              ),
              onTap: () => _showThemeDialog(context, ref),
            ),
            ListTile(
              title: Text(
                "App Language",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              trailing: IntrinsicWidth(
                child: Row(
                  children: [
                    Text(language.name,
                        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(IconPath.rightArrowIcon, height: 20.h, width: 20.w)
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LanguageScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeModeProvider.notifier);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Choose your theme",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),
              ),
              SizedBox(height: 20.h),
              Divider(height: 1.h, color: Color(0xffEEEEEE)),
              SizedBox(height: 20.h),

              // System Default
              Consumer(
                builder: (context, ref, _) {
                  final theme = ref.watch(themeModeProvider);
                  return RadioListTile<ThemeMode>(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    activeColor: Color(0xff7F27FF),
                    title: Text("System Default",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    value: ThemeMode.system,
                    groupValue: theme,
                    onChanged: (v) => themeNotifier.setTheme(v!),
                  );
                },
              ),

              // Light
              Consumer(
                builder: (context, ref, _) {
                  final theme = ref.watch(themeModeProvider);
                  return RadioListTile<ThemeMode>(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    activeColor: Color(0xff7F27FF),
                    title: Text("Light",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    value: ThemeMode.light,
                    groupValue: theme,
                    onChanged: (v) => themeNotifier.setTheme(v!),
                  );
                },
              ),

              // Dark
              Consumer(
                builder: (context, ref, _) {
                  final theme = ref.watch(themeModeProvider);
                  return RadioListTile<ThemeMode>(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    activeColor: Color(0xff7F27FF),
                    title: Text("Dark",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    value: ThemeMode.dark,
                    groupValue: theme,
                    onChanged: (v) => themeNotifier.setTheme(v!),
                  );
                },
              ),

              SizedBox(height: 20.h),
              Divider(height: 1.h, color: Color(0xffEEEEEE)),
              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: CustomSecondaryButton(
                      title: "Cancel",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomPrimaryButton(
                      title: "OK",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

}
