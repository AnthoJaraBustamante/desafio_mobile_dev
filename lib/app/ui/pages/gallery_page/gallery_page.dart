import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_mobile_dev/app/ui/global_widgets/card_image.dart';
import 'package:desafio_mobile_dev/app/ui/pages/gallery_page/controllers/gallery_controller.dart';
import 'package:desafio_mobile_dev/app/ui/pages/gallery_page/widgets/details_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// •	Vista de Galería: En esta vista se muestran las imágenes cargadas, en forma de cuadrícula tipo mosaico.
// •	Debe existir navegación para cambiar de vistas en cualquier momento, mostrando la información respectiva, por ejemplo si se han cargado 3 imágenes, en la vista de galería se muestra 1 en primera fila y 2 en la fila siguiente.
// •	En la vista de galería, al mostrar una imagen por fila, esa imagen debe ocupar todo el ancho.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería'),
      ),
      body: GetBuilder<GalleryController>(
        builder: (_) {
          return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: GalleryContent(controller: _));
        },
      ),
    );
  }
}

class GalleryContent extends StatelessWidget {
  const GalleryContent({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final GalleryController controller;
  @override
  Widget build(BuildContext context) {
    var selected = controller.selectedPhotos[controller.selectedId].url;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CardImages(
            id: controller.selectedId,
            image: selected,
            itemCount: controller.itemCount,
            onTap: () {
              Get.dialog(PhotoViewDetails(image: selected));
            },
          ),
        ),
        if (controller.selectedPhotos.length > 1)
          CarouselSlider(
            carouselController: controller.carouselController,
            items: [
              ...controller.selectedPhotos.map(
                (e) => CardImages(
                  id: e.id,
                  image: e.url,
                  itemCount: controller.itemCount,
                  margin: 5.0,
                  borderRadius: 10.0,
                  onTap: () {},
                ),
              ),
            ],
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlay: false,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.5,
              onPageChanged: controller.onPageChanged,
            ),
          )
      ],
    );
  }
}
