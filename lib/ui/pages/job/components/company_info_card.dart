import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/others/rounded_network_image.dart';
import '../../search/components/search_job_card.dart';

class CompanyInfoCard extends StatelessWidget {
  final String companyName;
  final String companyLogo;
  final String location;
  final DateTime? joinedText;
  final String openJobsText;
  final String address;
  final String phone;
  final String email;
  final String website;

  const CompanyInfoCard({
    super.key,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    this.joinedText,
    required this.openJobsText,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Company name and location
        Row(
          children: [
            RoundedNetworkImage(
              imageUrl: companyLogo,
              width: 50,
              height: 50,
              borderRadius: 8,
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                       Icon(
                        Icons.location_on,
                        size: 14,
                        color: colorTheme.grey,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          location,
                          style: theme.bodySmall?.copyWith(
                            color: colorTheme.grey700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          'Joined  ${getTimeAgo(joinedText ?? DateTime.now())}',
          style: theme.bodySmall?.copyWith(color: colorTheme.grey600),
        ),

        const SizedBox(height: 8),

        GestureDetector(
          onTap: () {
            // TODO: Navigate to open jobs page
          },
          child: Text(
            openJobsText,
            style: theme.bodyMedium?.copyWith(
              color: colorTheme.buttonPrimaryColor,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// Address & Contact Info
        _infoRow(Icons.home_outlined, address, context),
        _infoRow(Icons.phone, phone, context, onTap: () => _launchPhone(phone)),
        _infoRow(
          Icons.email_outlined,
          email,
          context,
          onTap: () => _launchEmail(email),
        ),
        _infoRow(
          Icons.language,
          website,
          context,
          onTap: () => _launchUrl(website),
        ),
      ],
    );
  }

  Widget _infoRow(
    IconData icon,
    String text,
    BuildContext context, {
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18, color: colorTheme.grey700),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: theme.bodyMedium?.copyWith(color: colorTheme.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
