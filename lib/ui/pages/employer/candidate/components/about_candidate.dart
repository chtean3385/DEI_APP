import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class AboutCandidate extends StatelessWidget {
  const AboutCandidate({super.key});

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
            "About Candidate",
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Having more than 5 years of experience. A BCA graduate with a passion for developing scalable web applications and working on both the front-end andback-end of software projects. Completed several academic projects using mern technologies showcasing afoundational ",
            style: context.textTheme.displaySmall?.copyWith(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}