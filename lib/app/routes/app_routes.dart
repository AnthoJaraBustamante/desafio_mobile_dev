import 'package:desafio_mobile_dev/app/ui/pages/gallery_page/gallery_page.dart';
import 'package:desafio_mobile_dev/app/ui/pages/login_page/login_page.dart';
import 'package:desafio_mobile_dev/app/ui/pages/upload_page/upload_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String upload = '/upload';
  static const String gallery = '/gallery';
  static Map<String, Widget Function(dynamic context)> routes = {
    login: (context) => const LoginPage(),
    upload: (context) => const UploadPage(),
    gallery: (context) => const GalleryPage(),
  };
}
