import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/l10n/app_localizations.dart';

import '../widget/language_pop_up_menu.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        centerTitle: true,
        actions: [
          LanguagePopUpMenu(),
          SizedBox(width: 16,)
        ],
      ),

    );
  }
}
