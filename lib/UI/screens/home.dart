import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:space_news/bloc/mars_photos/mars_photos_cubit.dart';

import '../widgets/home_drawer.dart';
import '../widgets/mars_photo_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => MarsPhotosCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(strings.app_title)),
        body: BlocBuilder<MarsPhotosCubit, MarsPhotosState>(
          builder: (context, state) {
            final MarsPhotosCubit cubit = context.read<MarsPhotosCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text("Select Date"),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: cubit.selectedDate ??
                          DateTime.now().subtract(
                            const Duration(days: 30),
                          ),
                      firstDate: DateTime(2018),
                      lastDate: DateTime.now(),
                    );
                    cubit.changeSelectedDate(selectedDate);
                  },
                  subtitle: cubit.selectedDate != null
                      ? Text(DateFormat.yMMMd().format(cubit.selectedDate!))
                      : null,
                ),
                state is MarsPhotosLoading
                    ? const Center(child: CircularProgressIndicator())
                    : cubit.marsPhotos.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: cubit.marsPhotos.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return PhotoCard(
                                    photo: cubit.marsPhotos[index]);
                              },
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text("There is no photos"),
                            ),
                          ),
              ],
            );
          },
        ),
        drawer: const HomeDrawer(),
      ),
    );
  }
}
