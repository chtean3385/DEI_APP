
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';


enum ImageType {
  profile,
  cover,
  dish,
}
class ImageUploadService {
  static const int _minQuality = 40;

  /// Entry method
  static Future<File> processImage(
      File file, {
        required ImageType type,
      }) async {
    final originalKB = file.lengthSync() ~/ 1024;
    debugPrint("📦 Original size: $originalKB KB");

    final config = _configFor(type);

    // 🚀 Skip compression if already small
    if (originalKB <= config.targetKB) {
      debugPrint("✅ Skipped compression");
      return file;
    }

    return _compressImage(
      file,
      config: config,
    );
  }

  /// Compression logic
  static Future<File> _compressImage(
      File file, {
        required _ImageConfig config,
      }) async {
    final dir = await getTemporaryDirectory();
    final targetPath =
        "${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";

    int quality = 80;
    File? compressed;

    while (quality >= _minQuality) {
      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: quality,
        format: CompressFormat.jpeg,
      );

      if (result == null) break;

      compressed = File(result.path);
      final newKB = compressed.lengthSync() ~/ 1024;

      debugPrint("🔁 Quality $quality → $newKB KB");

      if (newKB <= config.targetKB) break;

      quality -= 10;
    }

    return compressed ?? file;
  }

  /// Config per image type
  static _ImageConfig _configFor(ImageType type) {
    switch (type) {
      case ImageType.profile:
        return const _ImageConfig(
          targetKB: 200,
          minWidth: 512,
          minHeight: 512,
          maxUploadMB: 20,
        );

      case ImageType.cover:
        return const _ImageConfig(
          targetKB: 400,
          minWidth: 1200,
          minHeight: 675,
          maxUploadMB: 20,
        );

      case ImageType.dish:
        return const _ImageConfig(
          targetKB: 400,
          minWidth: 1080,
          minHeight: 1080,
          maxUploadMB: 20,
        );
    }
  }
}

/// Internal config model
class _ImageConfig {
  final int targetKB;
  final int minWidth;
  final int minHeight;
  final int maxUploadMB;

  const _ImageConfig({
    required this.targetKB,
    required this.minWidth,
    required this.minHeight,
    required this.maxUploadMB,
  });
}
Future<int?> getImageSizeFromUrl(String? url) async {
  if (url == null || url.trim().isEmpty) {
    debugPrint("URL cannot be null or empty");
    return null;
  }

  final trimmedUrl = url.trim(); // <-- important

  try {
    final dio = Dio();
    final response = await dio.head(trimmedUrl);
    final length = response.headers.value('content-length');
    if (length == null) return null;
    return int.parse(length); // bytes
  } catch (e, st) {
    debugPrint("Error fetching image size: $e\n$st");
    return null;
  }
}


Future<void> checkImageSize(String url) async {
  final bytes = await getImageSizeFromUrl(url); // await the Future
  if (bytes == null) return;

  final kb = bytes / 1024;
  // final mb = kb / 1024;

  print("Image size: ${kb.toStringAsFixed(2)} KB");
  // print("Image size: ${mb.toStringAsFixed(2)} MB");
}