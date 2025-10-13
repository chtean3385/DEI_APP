import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

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
          Row(
            children: [
              Expanded(
                child: Text(
                  "Basic Details",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "View Resume",
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.work, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Software Developer",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.currency_rupee, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "30-40 LPA",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.email, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "johndeo234@gmail.com",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.phone, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "9876543210",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "ABC House, Vashi, CDB PO, Navi Mumbai, Maharashtra, India",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "4.5 (69 reviews)",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}