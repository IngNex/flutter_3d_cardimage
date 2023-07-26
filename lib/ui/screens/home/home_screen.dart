import 'package:flutter/material.dart';
import 'package:flutter_3d_cardimage/ui/screens/home/widgets/card_3d.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _float = false;
  List _images = [
    [
      'assets/dark_rider-title.png',
      'assets/dark_rider-character.png',
      'assets/dark_rider-cover.jpg',
    ],
    [
      'assets/force_mage-title.png',
      'assets/force_mage-character.png',
      'assets/force_mage-cover.jpg',
    ],
  ];
  late List<AnimationController> animationController;
  // late final animationController = AnimationController(
  //   vsync: this,
  //   lowerBound: 0,
  //   upperBound: 0.5,
  //   duration: const Duration(milliseconds: 250),
  // );
  @override
  void initState() {
    int numberOfImages = _images.length;
    animationController = List.generate(
      numberOfImages,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 400,
        ), // Ajusta la duración de la animación según lo desees
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in animationController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(50.0),
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_float) {
                            animationController[index].forward();
                          } else {
                            animationController[index].reverse();
                          }
                          _float = !_float;
                        },
                        child: AnimatedBuilder(
                          animation: animationController[index],
                          builder: (context, _) {
                            return Card3D(
                              value: animationController[index].value,
                              image_title: _images[index][0],
                              image_front: _images[index][1],
                              image_back: _images[index][2],
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
/*
MouseRegion(
              onEnter: (_) {
                animationController.forward();
              },
              onExit: (_) {
                animationController.reverse();
              },
              child: GestureDetector(
                onTap: () {
                  if (_float) {
                    animationController.forward();
                  } else {
                    animationController.reverse();
                  }
                  _float = !_float;
                },
                child: AnimatedBuilder(
                  key: Key('hola2'),
                  animation: animationController,
                  builder: (context, _) {
                    return Card3D(
                      value: animationController.value,
                      image_title: 'assets/force_mage-title.png',
                      image_front: 'assets/force_mage-character.png',
                      image_back: 'assets/force_mage-cover.jpg',
                    );
                  },
                ),
              ),
            ),
 */