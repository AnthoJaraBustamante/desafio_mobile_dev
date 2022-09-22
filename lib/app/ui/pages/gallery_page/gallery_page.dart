import 'package:desafio_mobile_dev/app/data/providers/upload_image_provider.dart';
import 'package:desafio_mobile_dev/app/ui/global_widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider(
       create: (_) => UploadImageProvider(),
        child: const GalleryContent(),
      ),
    );
  }
}

class GalleryContent extends StatelessWidget {
  const GalleryContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UploadImageProvider provider =
        Provider.of<UploadImageProvider>(context);
    provider.init();
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 200,
          width: double.infinity,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2, 
            children: [
              ...provider.savedPhotos
                  .map((e) => CardImages(
                        isDeactivated: true,
                        id: e.id,
                        image: e.url,
                        itemCount: provider.savedPhotos.length,
                      ))
                  .toList()
            ],
          ),
        ),
      ],
    );
  }
}
