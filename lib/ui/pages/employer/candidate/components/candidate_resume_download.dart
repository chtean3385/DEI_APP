import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/others/custom_theme_button.dart';


class CandidateResumeDownload extends ConsumerWidget {
  const CandidateResumeDownload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(candidateProfileProvider);
    final controller = ref.read(candidateProfileProvider.notifier);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Documents",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.picture_as_pdf, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Resume",
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),

                    ),
                Text(
                  "uploads/resumes/1760782951900-LOE Template.pdf",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12), // spacing between buttons
                child: CustomThemeButton(
                  radius: 8,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  color:AppColors.bg ,
                  borderColor:  Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.get_app_outlined, color: Colors.black54, size: 16),
                      const SizedBox(width: 8),
                      Text(
                         "Download", // assuming CtaModels has a text property
                        style: context.textTheme.displaySmall?.copyWith(
                          color:   Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    controller.downloadResumeFromUrl();
                    // perform your action (e.g., open link or navigate)

                  },
                ),
              )


            ],
          ),

        ],
      ),
    );
  }
}