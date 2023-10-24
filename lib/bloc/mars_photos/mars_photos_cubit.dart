import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mars_photos_state.dart';

class MarsPhotosCubit extends Cubit<MarsPhotosState> {
  MarsPhotosCubit() : super(MarsPhotosInitial());

  static MarsPhotosCubit get(context) =>
      BlocProvider.of<MarsPhotosCubit>(context);
}
