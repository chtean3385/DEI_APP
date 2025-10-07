
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class WhatWeDo extends StatelessWidget {
  final String title;
  final String details;

  const WhatWeDo({ required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.textTheme.labelMedium,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          gapH8(),
          Text(
            details,
          style: context.textTheme.displaySmall?.copyWith(color: Colors.black87),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
