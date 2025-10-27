import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:flutter/material.dart';

Future<void> downloadResume(String fileUrl) async {
  try {
    // Get the app's document directory
    final dir = await getApplicationDocumentsDirectory();

    // Extract the file name from the URL
    final fileName = fileUrl.split('/').last;

    // Full path to save
    final filePath = '${dir.path}/$fileName';

    // Start download
    final dio = Dio();
    debugPrint('Downloading $fileUrl ...');
    await dio.download(
      fileUrl,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          debugPrint('Download progress: ${(received / total * 100).toStringAsFixed(0)}%');
        }
      },
    );

    debugPrint('✅ File downloaded to: $filePath');

    // Open the downloaded file
    await OpenFilex.open(filePath);

  } catch (e) {
    debugPrint('❌ Error downloading file: $e');
  }
}
