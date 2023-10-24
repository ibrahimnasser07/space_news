import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:space_news/data/API/api.dart';
import 'package:space_news/utils/route_constants.dart';

import '../widgets/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final _api = API();
    return Scaffold(
      appBar: AppBar(title: Text(strings.app_title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(
            width: 80.w,
            child: FilledButton(
              onPressed: () => context.push(news),
              child: Text(
                strings.news,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          )
        ],
      ),
      drawer: const HomeDrawer(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            _api.fetchPhotos(DateTime.now());
          }, child: const Icon(Icons.abc)),
    );
  }
}
