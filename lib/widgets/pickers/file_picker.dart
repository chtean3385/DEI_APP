import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';


/// Pick a file from device storage
///
/// Supports multiple file types and validates file size
///
/// Parameters:
/// - [allowedExtensions]: List of allowed file extensions (e.g., ['pdf', 'doc', 'docx'])
/// - [maxSizeInMB]: Maximum file size in megabytes (default: 5MB)
/// - [allowMultiple]: Allow selecting multiple files (default: false)
/// - [fileType]: Type of files to pick (default: FileType.custom)
///
/// Returns:
/// - Single file: PlatformFile? when allowMultiple is false
/// - Multiple files: List<PlatformFile>? when allowMultiple is true
Future<dynamic> pickFileFromStorage({
  List<String>? allowedExtensions,
  int maxSizeInMB = 5,
  bool allowMultiple = false,
  FileType fileType = FileType.custom,
}) async {
  PlatformFile? pickedFile;
  List<PlatformFile>? pickedFiles;

  // ✅ No permission check needed — FilePicker uses system picker
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
      withData: kIsWeb,
      withReadStream: !kIsWeb,
    );

    if (result != null) {
      if (allowMultiple) {
        List<PlatformFile> validFiles = [];
        for (var file in result.files) {
          if (await validateFileSize(file, maxSizeInMB)) {
            validFiles.add(file);
          }
        }
        pickedFiles = validFiles.isNotEmpty ? validFiles : null;
        return pickedFiles;
      } else {
        pickedFile = result.files.single;
        if (await validateFileSize(pickedFile, maxSizeInMB)) {
          return pickedFile;
        } else {
          return null;
        }
      }
    }
  } catch (e) {
    debugPrint('File picker error: $e');
    return null;
  }

  return allowMultiple ? pickedFiles : pickedFile;
}

/// Pick document files (PDF, DOC, DOCX)
Future<PlatformFile?> pickDocumentFile({
  int maxSizeInMB = 5,
}) async {
  return await pickFileFromStorage(
    allowedExtensions: ['pdf', 'doc', 'docx'],
    maxSizeInMB: maxSizeInMB,
    allowMultiple: false,
    fileType: FileType.custom,
  );
}

/// Pick resume file specifically
Future<PlatformFile?> pickResumeFile() async {
  return await pickDocumentFile(maxSizeInMB: 5);
}

/// Pick image files
Future<PlatformFile?> pickImageFile({
  int maxSizeInMB = 10,
}) async {
  return await pickFileFromStorage(
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
    maxSizeInMB: maxSizeInMB,
    allowMultiple: false,
    fileType: FileType.custom,
  );
}

/// Pick video files
Future<PlatformFile?> pickVideoFile({
  int maxSizeInMB = 50,
}) async {
  return await pickFileFromStorage(
    allowedExtensions: ['mp4', 'mov', 'avi', 'mkv'],
    maxSizeInMB: maxSizeInMB,
    allowMultiple: false,
    fileType: FileType.custom,
  );
}

/// Pick audio files
Future<PlatformFile?> pickAudioFile({
  int maxSizeInMB = 20,
}) async {
  return await pickFileFromStorage(
    allowedExtensions: ['mp3', 'wav', 'aac', 'm4a'],
    maxSizeInMB: maxSizeInMB,
    allowMultiple: false,
    fileType: FileType.custom,
  );
}

/// Pick any type of file
Future<PlatformFile?> pickAnyFile({
  int maxSizeInMB = 10,
}) async {
  return await pickFileFromStorage(
    fileType: FileType.any,
    maxSizeInMB: maxSizeInMB,
    allowMultiple: false,
  );
}

/// Pick multiple files
Future<List<PlatformFile>?> pickMultipleFiles({
  List<String>? allowedExtensions,
  int maxSizeInMB = 5,
  FileType fileType = FileType.custom,
}) async {
  return await pickFileFromStorage(
    allowedExtensions: allowedExtensions,
    maxSizeInMB: maxSizeInMB,
    allowMultiple: true,
    fileType: fileType,
  );
}

/// Validate file size
Future<bool> validateFileSize(PlatformFile file, int maxSizeInMB) async {
  try {
    int fileSizeInBytes;

    if (kIsWeb) {
      // On web, use bytes property
      fileSizeInBytes = file.size;
    } else {
      // On mobile, get file size from path
      if (file.path != null) {
        File fileObj = File(file.path!);
        fileSizeInBytes = await fileObj.length();
      } else {
        debugPrint('File path is null');
        return false;
      }
    }

    int maxSizeInBytes = maxSizeInMB * 1024 * 1024;

    if (fileSizeInBytes > maxSizeInBytes) {
      debugPrint(
          'File size exceeds limit: ${(fileSizeInBytes / (1024 * 1024)).toStringAsFixed(2)} MB > $maxSizeInMB MB');
      // You can show a snackbar or dialog here
      return false;
    }

    return true;
  } catch (e) {
    debugPrint('Error validating file size: $e');
    return false;
  }
}

/// Get file extension from file name
String getFileExtension(String fileName) {
  return fileName.split('.').last.toLowerCase();
}

/// Get readable file size
String getReadableFileSize(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  } else if (bytes < 1024 * 1024) {
    return '${(bytes / 1024).toStringAsFixed(2)} KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  } else {
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }
}

// Add to pubspec.yaml:
// dependencies:
//   file_picker: ^5.5.0
//   permission_handler: ^11.0.1
//   device_info_plus: ^9.1.0