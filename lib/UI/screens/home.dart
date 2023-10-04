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
    final strings = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.helloWorld)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
              value: settings.get(languageValue),
              items: <String>["en", "ar"]
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
              onChanged: (locale) => settings.put(languageValue, locale)),
          Switch(
            value: settings.get(darkModeValue),
            onChanged: (val) => settings.put(darkModeValue, val),
          ),
          FilledButton(
            onPressed: () => context.push(news,extra: "Mohamed Ahmed"),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(
              strings.news,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
