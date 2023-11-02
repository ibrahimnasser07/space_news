import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/mars_photo.dart';
import '../../data/repo/repo.dart';

part 'mars_photos_state.dart';

class MarsPhotosCubit extends Cubit<MarsPhotosState> {
  MarsPhotosCubit() : super(MarsPhotosInitial());

  final _repo = Repo();

  List<MarsPhoto> marsPhotos = [];

  DateTime? selectedDate;

  void changeSelectedDate(DateTime? selectedDate) async {
    if(selectedDate != null){
      this.selectedDate = selectedDate;
      emit(SelectedDateChanged());
    } else {
      emit(SelectedDateIsNull());
    }
  }

  Future<void> fetchPhotos(DateTime earthDate) async {
    emit(MarsPhotosLoading());
    marsPhotos = await _repo.fetchPhotos(earthDate);
    emit(MarsPhotosLoaded());
  }
}
