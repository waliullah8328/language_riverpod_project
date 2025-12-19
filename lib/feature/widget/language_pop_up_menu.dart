import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/feature/language/language.dart';

class LanguagePopUpMenu extends ConsumerWidget{
  const LanguagePopUpMenu({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return PopupMenuButton<Language>(
      onSelected: (value)=>ref.read(languageProvider.notifier).update((_)=>value),
        itemBuilder: (context)=> [
          for(var value in Language.values)
            PopupMenuItem(
              value: value,
                child: Row(children: [
              Text(value.flag),
              SizedBox(width: 8,),
              Text(value.name),
            ],)),


        ],
      child: Text(language.name,style: TextStyle(color: Colors.black),),
    );
  }
}
