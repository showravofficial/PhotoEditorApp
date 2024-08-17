import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imgedit/widgets/image_grid.dart';
import 'package:provider/provider.dart';
import 'package:imgedit/providers/image_provider.dart'; // Ensure the correct import

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderClass>(context); // Correct class name

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photo Editor App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              imageProvider.pickImage();
            },
          ),
        ],
      ),
      body: ImageGrid(),
    );
  }
}
