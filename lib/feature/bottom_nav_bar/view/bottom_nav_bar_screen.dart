// lib/bottom_nav/view/bottom_nav_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/core/utils/constants/icon_path.dart';
import 'package:language_riverpod_project/feature/home_page/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../l10n/app_localizations.dart';
import '../view_model/bottom_nav_bar_view_model.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final notifier = ref.read(bottomNavProvider.notifier);



    final List<Widget> pages = [
      const AccountScreen(),
      const AccountScreen(),
      const AccountScreen(),
      const AccountScreen(),


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
              icon: SvgPicture.asset(currentIndex == 0?IconPath.homeActiveIcon:IconPath.homeInActiveIcon,height: 18.h,width: 18.w,),

              label: AppLocalizations.of(context)!.home,


            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(currentIndex == 1?IconPath.reportActiveIcon:IconPath.reportInActiveIcon,height: 18.h,width: 18.w,),

              label: AppLocalizations.of(context)!.report,


            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(currentIndex == 2?IconPath.historyActiveIcon:IconPath.historyInActiveIcon,height: 18.h,width: 18.w,),

              label: AppLocalizations.of(context)!.history,


            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(currentIndex == 3?IconPath.accountActiveIcon:IconPath.accountInActiveIcon,height: 18.h,width: 18.w,),

              label: AppLocalizations.of(context)!.account,


            ),

          ],
        ),
      ),
    );
  }
}
