import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';
import '../../../widgets/others/app_bar_common.dart';
import 'components/upload_button.dart';

class UploadProfilePic extends StatelessWidget {
  const UploadProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarCommon(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH16(),
              Text("Profile picture", style: theme.headlineMedium),
              gapH4(),
              Text("Profile with photo has 40% higher chances of getting noticed by recruiters", style: theme.displaySmall?.copyWith(color: Colors.black54)),
              gap100(),
              Align(
                alignment: AlignmentGeometry.center,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person_add, // ✅ Add Profile Image icon
                        size: 150,         // optional: adjust size
                        color: Colors.grey.shade600, // optional: adjust color
                      ),
                    ),
                    gapH16(),

                    Text("Supported file formats:PNG,JPG,JPEG. maximum file siz up to 2 MB ", style: theme.displaySmall?.copyWith(color: Colors.black54),textAlign: TextAlign.center,),
                    gapH8(),
                    Text("Terms of service ", style: theme.displaySmall?.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                  ],
                ),
              ),


              // Job list
          Spacer(),



              // Sticky bottom filter bar
              UploadButton(
                onClear: () => Navigator.pop(context),
                onApply: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

