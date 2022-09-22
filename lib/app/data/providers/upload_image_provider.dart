import 'package:desafio_mobile_dev/app/data/models/photo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UploadImageProvider extends ChangeNotifier {
  List<PhotoModel> savedPhotos = [];
  bool firstTime = true;
  late Box<PhotoModel> db;

  final TextEditingController _searchController = TextEditingController();

  PageController pageController = PageController();
  TextEditingController get searchController => _searchController;
  PhotoModel? currentPhoto;

  Future<void> addImage(String url) async {
    var photoModel = PhotoModel(id: savedPhotos.length, url: url);
    savedPhotos.add(photoModel);
    await db.clear();
    await db.addAll(savedPhotos);
    currentPhoto = savedPhotos.last;

    notifyListeners();
  }

  Future<void> removeImage(int id) async {
    savedPhotos.removeWhere((element) => element.id == id);
    await db.clear();
    await db.addAll(savedPhotos);
    notifyListeners();
  } 

  Future<void> init() async {
    if (!firstTime) return;
    db = await Hive.openBox('savedPhotos');

    savedPhotos.clear();
    if (db.isNotEmpty) {
      for (PhotoModel item in db.values) {
        savedPhotos.add(item);
      }
    }
    if (firstTime) {
      firstTime = false;
      notifyListeners();
    }
  }
}
