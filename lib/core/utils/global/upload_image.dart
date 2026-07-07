import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  ImagePickerUtils._();

  static final ImagePicker _picker = ImagePicker();


  static Future<File?> pickFromGallery({
    final double? maxWidth,
    final int? imageQuality,
  }) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  static Future<File?> pickFromCamera({
    final double? maxWidth,
    final int? imageQuality,
  }) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}