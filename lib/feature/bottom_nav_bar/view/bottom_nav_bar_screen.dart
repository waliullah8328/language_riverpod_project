// lib/bottom_nav/view/bottom_nav_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/feature/home_page/home_page.dart';

import '../../../core/utils/constants/app_colors.dart';

import '../../../l10n/app_localizations.dart';
import '../view_model/bottom_nav_bar_view_model.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final notifier = ref.read(bottomNavProvider.notifier);



    final List<Widget> pages = [
      const HomePage(),
      const HomePage(),
      const HomePage(),

    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 92.h,
        decoration: const BoxDecoration(


        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: notifier.setIndex,

          selectedLabelStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,


          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: currentIndex == 0?  AppColors.primary:AppColors.textPrimary,),
              label: AppLocalizations.of(context)!.home,


            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: currentIndex == 1? AppColors.primary:AppColors.textPrimary,),
              label: AppLocalizations.of(context)!.settings,


            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: currentIndex == 2? AppColors.primary:AppColors.textPrimary,),
              label: AppLocalizations.of(context)!.profile,


            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person,color: currentIndex == 3? AppColors.primary:AppColors.textPrimary,),
            //   label: AppLocalizations.of(context)!.home,
            //
            //
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings,color: currentIndex == 4? AppColors.primary:AppColors.textPrimary,),
            //   label: AppLocalizations.of(context)!.home,


            //),
          ],
        ),
      ),
    );
  }
}
