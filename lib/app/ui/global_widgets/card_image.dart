import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_mobile_dev/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CardImages extends StatelessWidget {
  const CardImages({
    Key? key,
    required this.id,
    required this.image,
    this.margin = 0.0,
    this.borderRadius = 0.0,
    this.onTapDelete,
    this.pageController,
    this.onPageChanged,
    required this.itemCount,
    this.isDeactivated = false,
  }) : super(key: key);
  final int id;
  final String image;
  final double margin;
  final double borderRadius;
  final void Function()? onTapDelete;
  final PageController? pageController;
  final void Function(int)? onPageChanged;
  final int? itemCount;
  final bool isDeactivated;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDeactivated) return;
        Navigator.pushNamed(
          context,
          AppRoutes.gallery,
        );
      },
      child: Stack(
        children: [
          Container(
            height: 500,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          //Añadir icono para quitar imagen
          Positioned(
            top: 10,
            right: 10,
            child: Visibility(
              visible: onTapDelete != null,
              child: Material(
                shape: const StadiumBorder(),
                color: Colors.black.withOpacity(0.3),
                child: IconButton(
                  splashRadius: 20,
                  onPressed: onTapDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
