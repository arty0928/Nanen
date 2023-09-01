import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<void> getImageFromPicker(Function(File) onImageSelected) async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imagePermanent = await saveFilePermanently(image.path);
    onImageSelected(imagePermanent);
  } on PlatformException catch (e) {
    print('Failed to pick image: $e');
  }
}

Future<File> saveFilePermanently(String imagePath) async {
  final directory = await getApplicationDocumentsDirectory();
  final name = basename(imagePath);
  final image = File('${directory.path}/$name');

  return File(imagePath).copy(image.path);
}
