import 'package:dei_champions/widgets/pickers/show_permission_alert.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../main.dart';

Future<XFile?> pickImageFromGalleryOrCamera(
    {bool isCircleShape = false,
    bool isSquareCrop = false,
    bool isLockAspectRatio = true,
      CropAspectRatioPreset ? ratio,
    }) async {
  XFile? pickedFile;
  bool storagePermission = false;
  AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
  if (!kIsWeb) {
    if (androidInfo.version.sdkInt > 32) {
      await Permission.photos.request();
      storagePermission = await Permission.photos.request().isGranted;
    } else {
      // For devices with SDK version less than 33, use READ_EXTERNAL_STORAGE
      await Permission.storage.request();
      storagePermission = await Permission.storage.request().isGranted;
    }
  }
  if (storagePermission) {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return await cropImage(
          imageFile: pickedFile,
          isCircleShape: isCircleShape,
          isLockAspectRatio: isLockAspectRatio,
          ratio:ratio,
          isSquareCrop: isSquareCrop);
    }
  } else {
    showPermissionAlert(
        requestMessage:
            '"${AppStrings.appName}" needs access to your media and camera');
  }
  return pickedFile;
}

Future<XFile?> cropImage(
    {required XFile imageFile,
      CropAspectRatioPreset ? ratio,
    bool isCircleShape = false,
    bool isSquareCrop = false,
    bool isLockAspectRatio = true}) async {
  CroppedFile? croppedFile;
  try {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            initAspectRatio: ratio ?? CropAspectRatioPreset.original,
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: Colors.white,
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
    return XFile(croppedFile!.path);
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