import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myerp/widgets/cached.image.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: AppCachedImage(imageUrl: imageUrl, fit: BoxFit.contain),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
