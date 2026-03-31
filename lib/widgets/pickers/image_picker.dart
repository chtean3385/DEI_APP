import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';


/// ===============================
Future<XFile?> pickImageFromGalleryOrCamera({
  bool isCircleShape = false,
  bool isSquareCrop = false,
  bool isLockAspectRatio = true,
  CropAspectRatioPreset? ratio,
}) async {
  try {
    // ✅ No permission handling needed
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (pickedFile == null) return null;

    return await cropImage(
      imageFile: pickedFile,
      isCircleShape: isCircleShape,
      isSquareCrop: isSquareCrop,
      isLockAspectRatio: isLockAspectRatio,
      ratio: ratio,
    );
  } catch (e) {
    debugPrint('Image pick error: $e');
    return null;
  }
}

Future<XFile?> cropImage(
    {required XFile imageFile,
      CropAspectRatioPreset ? ratio,
    bool isCircleShape = false,
    bool isSquareCrop = false,
    bool isLockAspectRatio = true}) async {
  CroppedFile? croppedFile;
  try {

    // CRITICAL: Set this BEFORE opening cropper
    if (Platform.isAndroid) {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );

      await Future.delayed(Duration(milliseconds: 100)); // Give time to apply

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
    croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            initAspectRatio: ratio ?? CropAspectRatioPreset.original,
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: false,
            statusBarColor: Colors.black,
            backgroundColor:Colors.black,
            aspectRatioPresets:ratio!= null ?  [ratio] : [
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPresetCustom(),
            ],
            lockAspectRatio: isLockAspectRatio),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioLockEnabled: isLockAspectRatio,
        ),
        WebUiSettings(
            context: navigatorKey.currentContext!,)
      ],
    );
    if (croppedFile == null) return null;
    return XFile(croppedFile.path);
  } catch (e) {
    debugPrint('crop error $e ');
    return null;
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}