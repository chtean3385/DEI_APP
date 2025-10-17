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
  final bool noPadding;
  final XFile? imageFile;
  final String? imageUrl;
  final Function editAction;
  final double radius;
  final double height;
  final double width;
  final GlobalKey<FormState>? formKey;

  const ImageViewPicker({
    super.key,
    this.imageFile,
    this.imageUrl,
    required this.editAction,
    this.hideAddButton = false,
    this.noPadding = false,
    this.radius = 50,
    this.formKey,
    required this.height,
    required this.width,
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
            if(!noPadding)   Card(
              color: Colors.white,
              elevation: 4,
              semanticContainer: true,
              borderOnForeground: true,
              margin: noPadding ? EdgeInsets.zero : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: field.hasError
                    ? BorderSide(color: Colors.red)
                    : BorderSide.none,
              ),
              child: imageFile != null
                  ? Padding(
                padding: noPadding
                    ? EdgeInsets.zero
                    : EdgeInsets.all( 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  child: Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ),
                ),
              )
                  : ImageUrlViewer(
                url: imageUrl,
                width: width,
                height: height,
                noPadding: noPadding,
                radius: radius,
              ),
            ),
            if(noPadding)   imageFile != null
                ? Padding(
              padding: noPadding
                  ? EdgeInsets.zero
                  : EdgeInsets.all( 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                child: Image.file(
                  File(imageFile!.path),
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
              ),
            )
                : ImageUrlViewer(
              url: imageUrl,
              width: width,
              height: height,
              noPadding: noPadding,
            ),
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
                    radius:  12,
                    child: Icon(
                      Icons.edit,
                      size:  16,
                      color: Colors.black,
                    ),
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
  final double width;
  final double height;
  final String? url;
  final bool noPadding;
  final double radius;

  const ImageUrlViewer({
    super.key,
    this.url,
    required this.height,
    required this.width,
    this.noPadding = false,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: noPadding
          ? EdgeInsets.zero
          : EdgeInsets.all( 4.0),
      child: SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          clipBehavior: Clip.antiAlias,
          child: url != null
              ? ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: height,
              width: width,
              imageUrl: url!,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: SizedBox(
                  height: height,
                  width: width,
                  child: ColoredBox(color: Colors.white),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: height,
                width: width,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image),
              ),
            ),
          )
              : Container(
            height: height,
            width: width,

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(radius))

            ),
            child: const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
