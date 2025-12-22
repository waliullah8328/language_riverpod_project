import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../language/language.dart';

// Define languages list (replace flags if needed)
final List<Map<String, String>> languages = [
  {'flag': '🇺🇸', 'name': 'English', 'code': 'en'},
  {'flag': '🇮🇳', 'name': 'Hindi', 'code': 'hi'},
  {'flag': '🇰🇷', 'name': 'Korea', 'code': 'ko'},
];




class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("LanguageScreen build");

    // Watch the selected language code
    final selectedLanguage = ref.watch(languageProvider.select((lang) => lang.code));

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Language"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final lang = languages[index];
          final isSelected = selectedLanguage == lang['code'];

          return LanguageTile(
            flag: lang['flag']!,
            name: lang['name']!,
            code: lang['code']!,
            selected: isSelected,
            onTap: () {
              // Update provider state
              ref.read(languageProvider.notifier).state =
                  Language.values.firstWhere((l) => l.code == lang['code']);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.flag,
    required this.name,
    required this.code,
    required this.selected,
    required this.onTap,
  });

  final String flag;
  final String name;
  final String code;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.only(bottom: 8.h),

      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(

          leading: Text(flag, style: const TextStyle(fontSize: 22)),
          title: Text(name, style: const TextStyle()),
          trailing: selected ? const Icon(Icons.check, color: Colors.purple) : null,
          onTap: onTap,
        ),
      ),
    );
  }
}
