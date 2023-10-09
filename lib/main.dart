import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:space_news/utils/color_schemes.g.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:space_news/utils/constants.dart';
import 'package:space_news/utils/custom_router.dart';
import 'package:sizer/sizer.dart';

import 'utils/typography.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(settingsBox);
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(settingsBox).listenable(),
      builder: (__, box, _) {
        bool darkMode = box.get(darkModeValue, defaultValue: false);
        String language = box.get(languageValue, defaultValue: "en");
        return Sizer(
            builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              title: nasaNews,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(language),
              themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                colorScheme: lightColorScheme,
                textTheme: textTheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                textTheme: textTheme,
                useMaterial3: true,
              ),
              routerConfig: appRouter.router,
            );
          }
        );
      },
    );
  }
}
