import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import '../../constants/app_styles.dart';
import '../others/app_card.dart';

class ImageViewPicker extends StatelessWidget {
  final bool hideAddButton;
  final XFile? imageFile;
  final String? imageUrl;
  final Function editAction;
  final double radius;
  final GlobalKey<FormState>? formKey;

  const ImageViewPicker({
    super.key,
    this.imageFile,
    this.imageUrl,
    required this.editAction,
    this.hideAddButton = false,
    this.radius = 50,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    bool isImageEmpty =
        imageFile == null && (imageUrl == null || imageUrl!.isEmpty);
    return FormField<String>(
      validator: (_) {
        if (isImageEmpty) return "Please upload an image";
        return null;
      },
      builder: (field) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              color: Colors.white,
              elevation: 4,
              semanticContainer: true,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: field.hasError
                    ? BorderSide(color: Colors.red)
                    : BorderSide.none,
              ),
              child: imageFile != null
                  ? Padding(
                      padding: EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.file(
                          File(imageFile!.path),
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    )
                  : ImageUrlViewer(url: imageUrl, size: 150),
            ),
            if (!isImageEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 10),
                child: GestureDetector(
                  onTap: () {
                    editAction();
                    field.didChange(imageFile?.path ?? imageUrl);
                    field.validate();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12,
                    child: Icon(Icons.edit, size: 16, color: Colors.black),
                  ),
                ),
              ),
            if (isImageEmpty)
              Positioned(
                bottom: 40,
                left: 35,
                child: AppCard(
                  onTap: () {
                    editAction();
                    field.didChange(imageFile?.path ?? imageUrl);
                    field.validate();
                  },
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 16, color: Colors.black38),
                      gapW8(),
                      Text(
                        "Tap to upload",
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall?.copyWith(
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ImageUrlViewer extends StatelessWidget {
  final double size;
  final String? url;

  const ImageUrlViewer({super.key, this.size = 32, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: SizedBox(
        width: size,
        height: size,
        child: FittedBox(
          clipBehavior: Clip.antiAlias,
          child: url != null
              ? ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: size,
                    width: size,
                    imageUrl: url!,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: SizedBox(
                        height: size,
                        width: size,
                        child: ColoredBox(color: Colors.white),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: size,
                      width: size,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                )
              : Container(
                  height: size,
                  width: size,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                ),
        ),
      ),
    );
  }
}
