import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imgedit/providers/image_provider.dart';
import 'package:provider/provider.dart';

class ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final images = Provider.of<ImageProviderClass>(context).editedImages;

    return GridView.builder(
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => GridTile(
        child: Image.file(
          File(images[i].path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
