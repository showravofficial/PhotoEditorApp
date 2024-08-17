import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditImageScreen extends StatelessWidget {
  final File imageFile;

  EditImageScreen({required this.imageFile});

  Future<void> _cropImage(BuildContext context) async {
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
    );

    if (cropped != null) {
      Navigator.of(context).pop(File(cropped.path));
    }
  }

  Future<void> _rotateImage(BuildContext context) async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Image'),
        actions: [
          IconButton(
            icon: Icon(Icons.crop),
            onPressed: () => _cropImage(context),
          ),
          IconButton(
            icon: Icon(Icons.rotate_right),
            onPressed: () => _rotateImage(context),
          ),
        ],
      ),
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}
