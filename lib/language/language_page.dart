import 'package:banking_app/language/bloc/language_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return Text("Language");
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("English"),
            onTap: (){context.locale = Locale('en', 'US');}
          ),
          ListTile(
            title: Text("Russian"),
            onTap: (){context.locale = Locale('ru', 'RU');}
          ),
          ListTile(
            title: Text("Uzbek"),
            onTap: (){
              context.locale = Locale('uz', 'UZ');
            }
          )
        ],
      ),
    );
  }
}
