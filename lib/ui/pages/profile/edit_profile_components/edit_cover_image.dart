import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/pickers/profile_pic_edit_widget.dart';

class EditEmployerCoverImage extends ConsumerWidget {
  const EditEmployerCoverImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        // collapsed by default
        title: Text(
          "Cover Image",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [_coverImage(ref)],
      ),
    );
  }

  Widget _coverImage(WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);
    // Height a bit more than profile image (profile ~150, cover ~200-250)
    return ImageViewPicker(
      // formKey: _formKey,
      imageUrl: state.profileData?.coverImageUrl,
      imageFile: state.coverFile,
      height: 200,
      width: double.infinity,
      noPadding: true,
      editAction: () async {
        controller.pickCoverImage();
      },
    );
  }
}
