import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:space_news/utils/constants.dart';
import 'package:space_news/utils/route_constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Box settings = Hive.box(settingsBox);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.helloWorld)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
            valueListenable: Hive.box(settingsBox).listenable(),
            builder: (context, box, _) {
              String language = settings.get(languageValue, defaultValue: "en");
              return Switch(
                value: language == "en",
                onChanged: (val) =>
                    settings.put(languageValue, val ? "en" : "ar"),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box(settingsBox).listenable(),
            builder: (context, box, _) {
              bool darkMode = settings.get(darkModeValue, defaultValue: false);
              return Switch(
                value: darkMode,
                onChanged: (val) {
                  settings.put(darkModeValue, !darkMode);
                },
              );
            },
          ),
          FilledButton(
            onPressed: () => context.push(news),
            child: Text("News"),
          )
        ],
      ),
    );
  }
}
