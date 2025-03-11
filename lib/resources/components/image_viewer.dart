import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ImageViewerScreen extends StatelessWidget {
  final List images; // A list of images with their paths and type
  final int initialIndex;
  const ImageViewerScreen({super.key, required this.images, this.initialIndex = 0});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: PageView.builder(
          itemCount: images.length,
          controller: PageController(initialPage: initialIndex),
          itemBuilder: (context, index) {
            final image = images[index];

            final String path = image["attachment"];
            final bool isHttpImage = path.startsWith('https');
            return InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: isHttpImage
                  ? Image.network(
                      path,
                      fit: BoxFit.contain,
                    )
                  : Image.file(
                      File(path),
                      fit: BoxFit.contain,
                    ),
            );
          },
        ),
      ),
    );
  }
}
