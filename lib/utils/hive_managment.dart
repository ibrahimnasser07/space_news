import 'package:hive_flutter/hive_flutter.dart';
import 'package:space_news/data/models/mars_photo.dart';
import 'package:space_news/utils/constants.dart';

class HiveManagment {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MarsPhotoAdapter());
    Hive.registerAdapter(CameraAdapter());

    await Hive.openBox(settingsBox);
    await Hive.openBox<MarsPhoto>(photosBox);
  }

  static void storeMarsPhotos(List<MarsPhoto> marsPhotos) {
    for (MarsPhoto photo in marsPhotos) {
      Hive.box<MarsPhoto>(photosBox).put(photo.id, photo);
    }
  }

  static List<MarsPhoto> getEarthDatePhotos(DateTime earthDate) {
    return Hive.box<MarsPhoto>(photosBox)
        .values
        .where((element) => earthDate == element.earthDate)
        .toList();
  }
}
