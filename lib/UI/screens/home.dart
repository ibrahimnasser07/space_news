import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:space_news/data/models/mars_photo.dart';
import 'package:space_news/data/repo/repo.dart';
import 'package:space_news/utils/route_constants.dart';

import '../widgets/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
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
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            List<MarsPhoto> photos =
                await Repo().fetchPhotos(DateTime(2023, 9, 26));
            debugPrint(photos.length.toString());
            if (photos.isNotEmpty) {
              debugPrint(photos[0].imgSrc);
            }
          },
          child: const Icon(Icons.abc)),
    );
  }
}
