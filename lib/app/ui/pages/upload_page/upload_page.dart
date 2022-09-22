import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //crear vista con campo input en la parte superior, para escribir o pegar una URL de imagen. Junto al input, debe existir un botón "cargar imagen". Al presionar cargar imagen, debe mostrar bajo el input, un cuadro grande con la imagen obtenida desde la URL, ocupando todo el ancho de la pantalla y hacia abajo dejando un espacio para mostrar una miniatura centrada de la misma imagen.
    // crea un search delegate

    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: _CardImages(
                  image: 'https://picsum.photos/250?image=0',
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                items: [
                  for (var i = 0; i < 5; i++)
                    _CardImages(
                      image: 'https://picsum.photos/250?image=$i',
                      margin: 5.0,
                      borderRadius: 10.0,
                    ),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              )
              //mostrar miniatura de todas las imagenes
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImages extends StatelessWidget {
  const _CardImages({
    Key? key,
    required this.image,
    this.margin = 0.0,
    this.borderRadius = 0.0,
  }) : super(key: key);

  final String image;
  final double margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Image.network(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: TextField(
              toolbarOptions: ToolbarOptions(
                copy: true,
                paste: true,
                cut: true,
                selectAll: true,
              ),
              enableInteractiveSelection: true,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ingresa URL',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Cargar imagen'),
          ),
        ],
      ),
    );
  }
}
//change color of cursor in textfield
// https://stackoverflow.com/questions/59170249/how-to-change-the-cursor-color-in-flutter