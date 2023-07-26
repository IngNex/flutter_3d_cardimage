import 'package:flutter/material.dart';

class ImageFront extends StatelessWidget {
  const ImageFront({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      fit: BoxFit.cover,
    );
  }
}
