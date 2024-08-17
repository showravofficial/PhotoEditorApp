import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../models/edited_image.dart';
import '../utils/database_helper.dart';

class ImageProviderClass with ChangeNotifier {
  List<EditedImage> _editedImages = [];

  List<EditedImage> get editedImages => _editedImages;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final savedImage = await _saveImage(File(pickedFile.path));
      _editedImages.add(savedImage);
      notifyListeners();
    }
  }

  Future<EditedImage> _saveImage(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = image.path.split('/').last;
    final savedImage = await image.copy('${appDir.path}/$fileName');
    final newImage = EditedImage(id: DateTime.now().toString(), path: savedImage.path);

    await DatabaseHelper.instance.insertImage(newImage);
    return newImage;
  }

  Future<void> loadImages() async {
    _editedImages = await DatabaseHelper.instance.getImages();
    notifyListeners();
  }
}
