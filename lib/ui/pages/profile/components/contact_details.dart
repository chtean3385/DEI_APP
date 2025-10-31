import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../providers/controllers/profile/employee_profile_controller.dart';
import '../../../../providers/providers.dart';

class ContactDetails extends ConsumerWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
    final controller = ref.read(employeeProfileProvider.notifier);
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
              ViewAllButton(
                showArrow: true,
                text: "View Resume",
                isSmall: true,
                onPressed: () => viewResumeFromUrl(state.profileData?.resume ?? ""),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                  state.profileData?.workStatus ?? "",
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
                  state.profileData?.preferences?.salaryRange ??
                      'Not specified',
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
                  state.profileData?.email ??  'Not specified',
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
                  state.profileData?.mobile ??  'Not specified',
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
                  "${ state.profileData?.address ?? ""}, ${ state.profileData?.city ?? ""}, ${ state.profileData?.state ?? ""}, ${ state.profileData?.country ?? ""}",
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
