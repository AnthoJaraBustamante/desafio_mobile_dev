import 'package:desafio_mobile_dev/app/data/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UploadController extends GetxController {
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

    update();
  }

  Future<void> removeImage(int id) async {
    savedPhotos.removeWhere((element) => element.id == id);
    await db.clear();
    await db.addAll(savedPhotos);
    update();
  }

  Future<void> init() async {
    db = await Hive.openBox('savedPhotos');

    savedPhotos.clear();
    if (db.isNotEmpty) {
      for (PhotoModel item in db.values) {
        savedPhotos.add(item);
      }
    }

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


}
