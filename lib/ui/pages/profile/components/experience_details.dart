import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ExperienceDetails extends StatelessWidget {
  const ExperienceDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(
            "Experience",
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.only(top: 12),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return item(context);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.black12, height: 48);
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "Senior Software Engineer",
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Jul 2021 - Present",
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          "Dreams Technology",
          style: context.textTheme.labelLarge?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 2),
        Text(
          "Having more than 5 years of experience. A BCA graduate with a passion for developing scalable web applications and working on both the front-end andback-end of software projects. Completed several academic projects using mern technologies showcasing afoundational ",
          style: context.textTheme.displaySmall?.copyWith(
            color: Colors.black54,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}