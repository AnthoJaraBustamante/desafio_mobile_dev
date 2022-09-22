import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_mobile_dev/app/data/models/photo_model.dart';
import 'package:desafio_mobile_dev/app/ui/pages/upload_page/controllers/upload_controller.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  int selectedId = Get.arguments[0];
  int itemCount = Get.arguments[1];

  List<PhotoModel> selectedPhotos = Get.find<UploadController>().savedPhotos;
  // List<PhotoModel> aux = Get.find<UploadController>().savedPhotos;
  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    goToSelectedIdPage();
  }
 
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void goToSelectedIdPage() {
    var indexWhere =
        selectedPhotos.indexWhere((element) => element.id == selectedId);

    carouselController.jumpToPage(indexWhere);
  }

  onPageChanged(int index, CarouselPageChangedReason reason) {
    selectedId = selectedPhotos[index].id;
    update();
  }
}
