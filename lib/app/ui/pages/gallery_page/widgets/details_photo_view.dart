import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewDetails extends StatelessWidget {
  const PhotoViewDetails({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: CachedNetworkImageProvider(image),
    );

    // return PhotoView.builder(
    //   itemCount: 10,
    //   builder: (BuildContext context, int index) {
    //     return CachedNetworkImage(
    //       imageUrl: image,
    //       fit: BoxFit.contain,
    //     );
    //   },
  }
}
