import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Box settings = Hive.box(settingsBox);
    final strings = AppLocalizations.of(context)!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                strings.app_title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          ListTile(
            title: Text(strings.language),
            trailing: DropdownButton<String>(
              value: settings.get(languageValue, defaultValue: "en"),
              items: <String>["en", "ar"]
                  .map(
                    (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
                  .toList(),
              onChanged: (locale) => settings.put(languageValue, locale),
              focusColor: Colors.transparent,
              underline: const SizedBox(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
          ListTile(
            title: Text(strings.theme),
            trailing: Switch(
              value: settings.get(darkModeValue, defaultValue: false),
              onChanged: (val) => settings.put(darkModeValue, val),
            ),
          ),
        ],
      ),
    );
  }
}