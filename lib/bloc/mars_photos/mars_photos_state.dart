part of 'mars_photos_cubit.dart';

@immutable
abstract class MarsPhotosState {}

class MarsPhotosInitial extends MarsPhotosState {}
class MarsPhotosLoading extends MarsPhotosState {}
class MarsPhotosLoaded extends MarsPhotosState {}
class SelectedDateChanged extends MarsPhotosState {}
class SelectedDateIsNull extends MarsPhotosState {}
