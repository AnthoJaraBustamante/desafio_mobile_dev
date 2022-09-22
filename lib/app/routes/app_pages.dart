import 'package:desafio_mobile_dev/app/routes/app_routes.dart';
import 'package:desafio_mobile_dev/app/ui/pages/gallery_page/bindings/gallery_binding.dart';
import 'package:desafio_mobile_dev/app/ui/pages/gallery_page/gallery_page.dart';
import 'package:desafio_mobile_dev/app/ui/pages/login_page/bindings/login_binding.dart';
import 'package:desafio_mobile_dev/app/ui/pages/login_page/login_page.dart';
import 'package:desafio_mobile_dev/app/ui/pages/upload_page/bindings/upload_binding.dart';
import 'package:desafio_mobile_dev/app/ui/pages/upload_page/upload_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final List<GetPage> pages = [
    //login upload and gallery
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.upload,
      page: () => const UploadPage(),
      binding: UploadBinding(),
    ),
    GetPage(
      name: AppRoutes.gallery,
      page: () => const GalleryPage(),
      binding: GalleryBinding(),
    ),
  ];
}
