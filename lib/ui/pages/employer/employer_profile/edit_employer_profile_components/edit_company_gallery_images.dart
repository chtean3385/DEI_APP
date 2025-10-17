import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../../../../widgets/others/rounded_network_image.dart';
import '../../../../../widgets/others/theme_extension.dart';
import '../../../profile/edit_profile_components/edit_profile_action_button.dart';

class EditEmployerImageGallery extends ConsumerWidget {
  final bool isFromCommonEdit;

  const EditEmployerImageGallery({super.key, this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editEmployerProfileProvider.notifier);
    final state = ref.watch(editEmployerProfileProvider);

    final List<String> urlImages = state.profileData?.galleryImageUrls ?? []; // Existing images
    final List<XFile> localImages = state.galleryLocalImages ?? []; // Newly added

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Text(
          "Company Image Gallery",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
        onExpansionChanged: isFromCommonEdit ? null : (_) {},
        childrenPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        children: [
          // Display existing images (URLs)
          if (urlImages.isNotEmpty)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: urlImages
                  .asMap()
                  .entries
                  .map((entry) => _galleryNetworkImage(
                context,
                entry.key,
                entry.value,
                    () => controller.removeUrlGalleryImage(entry.key),
              ))
                  .toList(),
            ),

          // Display local images
          if (localImages.isNotEmpty)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: localImages
                  .asMap()
                  .entries
                  .map((entry) => _galleryLocalImage(
                context,
                entry.key,
                entry.value.path,
                    () => controller.removeLocalGalleryImage(entry.key),
              ))
                  .toList(),
            ),

          if (urlImages.isEmpty && localImages.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "No images added yet.",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),

          gapH16(),
          CustomThemeButton(
            isExpanded: false,
            color: AppColors.primaryColor,
            radius: 8,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_a_photo, color: Colors.white, size: 20),
                const SizedBox(width: 4),
                Text(
                  "Add Image",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onTap: () => controller.pickGalleryImage(),
          ),

          if (!isFromCommonEdit)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: EditProfileActionButtons(
                onCancel: () => Navigator.pop(context),
                onSave: () {
                  // Implement save logic (e.g. upload local images)
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _galleryNetworkImage(
      BuildContext context, int index, String url, VoidCallback onRemove) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: RoundedNetworkImage(
            imageUrl: url,
            width: 120,
            height: 120,
            borderRadius: 12,
          ),
        ),
        _removeButton(onRemove),
      ],
    );
  }

  Widget _galleryLocalImage(
      BuildContext context, int index, String path, VoidCallback onRemove) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            File(path),
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        _removeButton(onRemove),
      ],
    );
  }

  Widget _removeButton(VoidCallback onRemove) => Positioned(
    top: 4,
    right: 4,
    child: GestureDetector(
      onTap: onRemove,
      child: const CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        child: Icon(Icons.close, size: 16, color: Colors.red),
      ),
    ),
  );
}
