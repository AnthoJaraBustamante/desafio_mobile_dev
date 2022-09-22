import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_mobile_dev/app/data/providers/upload_image_provider.dart';
import 'package:desafio_mobile_dev/app/ui/global_widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //crear vista con campo input en la parte superior, para escribir o pegar una URL de imagen. Junto al input, debe existir un botón "cargar imagen". Al presionar cargar imagen, debe mostrar bajo el input, un cuadro grande con la imagen obtenida desde la URL, ocupando todo el ancho de la pantalla y hacia abajo dejando un espacio para mostrar una miniatura centrada de la misma imagen.
    // crea un search delegate

    return ChangeNotifierProvider(
      create: (_) => UploadImageProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const SearchTextField(),
        ),
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CurrentCardImage(),
                SizedBox(height: 10),
                ThumbnailList(),
                SizedBox(height: 10),
                //mostrar miniatura de todas las imagenes
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentCardImage extends StatelessWidget {
  const CurrentCardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UploadImageProvider provider =
        Provider.of<UploadImageProvider>(context);
    provider.init();
    return provider.currentPhoto == null
        ? const SizedBox()
        : Expanded(
            child: CardImages(
              id: provider.currentPhoto!.id,
              image: provider.currentPhoto!.url,
              itemCount: provider.savedPhotos.length,
            ),
          );
  }
}

class ThumbnailList extends StatelessWidget {
  const ThumbnailList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UploadImageProvider provider =
        Provider.of<UploadImageProvider>(context);
    return CarouselSlider(
      items: [
        ...provider.savedPhotos
            .map(
              (e) => CardImages(
                id: e.id,
                image: e.url,
                margin: 5.0,
                borderRadius: 10.0,
                onTapDelete: () {
                  provider.removeImage(e.id);
                },
                itemCount: provider.savedPhotos.length,
                // pageController: provider.pageController,
              ),
            )
            .toList()
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
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadImageProvider provider =
        Provider.of<UploadImageProvider>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.white,
          selectionHandleColor: Colors.white,
          cursorColor: Colors.white,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: provider.searchController,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                paste: true,
                cut: true,
                selectAll: true,
              ),
              enableInteractiveSelection: true,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Ingresa URL',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (provider.searchController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ingrese una URL'),
                  ),
                );
                return;
              }
              //si la url no es una url valida
              if (!Uri.parse(provider.searchController.text).isAbsolute) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No es una URL válida'),
                  ),
                );
                return;
              }
              if (provider.savedPhotos.length >= 5) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Solo se pueden cargar 5 imágenes'),
                  ),
                );
                return;
              }
              provider.addImage(provider.searchController.text);
              provider.searchController.clear();
              return;
            },
            child: const Text('Cargar imagen'),
          ),
        ],
      ),
    );
  }
}
