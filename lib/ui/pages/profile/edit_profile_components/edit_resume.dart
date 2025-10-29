import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import 'edit_profile_action_button.dart';

class EditResumeInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditResumeInformation({super.key,this.isFromCommonEdit= true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editProfileProvider.notifier);
    final state = ref.watch(editProfileProvider);
    final theme = context.textTheme;

    final fileName = state.resumeFile?.name;

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: isFromCommonEdit!= true,
        title: Text(
          "Resume",
          style: theme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
        onExpansionChanged: isFromCommonEdit ? null : (_) {},
        childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Your Resume',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1e293b),
                ),
              ),
              const SizedBox(height: 24),

              // File picker section
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFf8fafc),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFcbd5e1)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomThemeButton(
                        onTap: controller.pickResume,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.attach_file,
                              color: Color(0xFF475569),
                            ),
                            const Text('Choose File'),
                          ],
                        ),
                        radius: 4,
                        color: Colors.black12,
                        borderColor:Colors.black12,
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        fileName ?? 'No file chosen',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: fileName != null
                              ? const Color(0xFF475569)
                              : const Color(0xFF94a3b8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Accepted formats: PDF, DOC, DOCX (Max size: 5MB)',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),

              if (fileName != null) ...[
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Current file: $fileName',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF334155),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomThemeButton(
                      onTap: controller.viewResume,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          gapW6(),
                          Text('View',style: theme.displaySmall?.copyWith(color: Colors.white)),
                        ],
                      ),
                      radius: 8,
                      color: AppColors.primaryColor,
                      borderColor:AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                    ),
                  ],
                ),
                const SizedBox(height: 32),


              ],
              gapH16(),
              if(isFromCommonEdit!= true)  Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: EditProfileActionButtons(
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onSave: () {
                      // Implement your save logic here
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
