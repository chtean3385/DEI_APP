import 'dart:io';

import 'package:flutter/material.dart';

void showImageDialog(BuildContext context, String imagePath, {bool isLocal = false}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.pop(context), // tap outside or image to close
        child: InteractiveViewer(
          child: isLocal
              ? Image.file(File(imagePath))
              : Image.network(imagePath),
        ),
      ),
    ),
  );
}
