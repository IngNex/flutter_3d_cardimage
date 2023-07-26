import 'package:flutter/material.dart';
import 'package:flutter_3d_cardimage/ui/screens/home/widgets/image_back.dart';
import 'package:flutter_3d_cardimage/ui/screens/home/widgets/image_front.dart';
import 'package:flutter_3d_cardimage/ui/screens/home/widgets/image_text.dart';

class Card3D extends StatelessWidget {
  const Card3D({
    Key? key,
    required this.value,
    required this.image_front,
    required this.image_title,
    required this.image_back,
  }) : super(key: key);

  final double value;
  final String image_front;
  final String image_title;
  final String image_back;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.5,
      child: AspectRatio(
        aspectRatio: 9 / 14,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateX(-value * 0.8),
              child: ImageBack(image: image_back),
            ),
            Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, -50 * value),
                child: Transform.scale(
                  alignment: Alignment.bottomCenter,
                  scale: 1 + (value / 0.5) * 0.15,
                  child: ImageFront(image: image_front),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Transform.translate(
                offset: Offset(0, -50 * value),
                child: ImageText(image: image_title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
