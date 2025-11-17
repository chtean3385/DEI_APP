import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Promotion Model Example
class PromotionModel {
  final String? imageUrl;       // if image promotion
  final String? heading;        // if text promotion
  final String? subHeading;
  final String? content;
  final String? buttonText;
  final String? buttonUrl;      // deep link / website

  PromotionModel({
    this.imageUrl,
    this.heading,
    this.subHeading,
    this.content,
    this.buttonText,
    this.buttonUrl,
  });
}

void showPromotionAlert(PromotionModel promo) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  final theme = Theme.of(context).textTheme;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // -------------------------------
              // 1️⃣ IMAGE PROMOTION
              // -------------------------------
              if (promo.imageUrl != null) ...[
                RoundedNetworkImage(imageUrl:  promo.imageUrl ?? "")
                ,
                const SizedBox(height: 16),
              ],

              // -------------------------------
              // 2️⃣ TEXT Heading/Subheading
              // -------------------------------
              if (promo.heading != null) ...[
                Text(
                  promo.heading!,
                  textAlign: TextAlign.center,
                  style: theme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
              ],

              if (promo.subHeading != null) ...[
                Text(
                  promo.subHeading!,
                  textAlign: TextAlign.center,
                  style: theme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 10),
              ],

              // -------------------------------
              // 3️⃣ TEXT Content
              // -------------------------------
              if (promo.content != null) ...[
                Text(
                  promo.content!,
                  textAlign: TextAlign.center,
                  style: theme.bodyMedium?.copyWith(
                    height: 1.4,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // -------------------------------
              // 4️⃣ BUTTON (Optional)
              // -------------------------------
              if (promo.buttonText != null) ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    promo.buttonText!,
                    style: theme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (promo.buttonUrl != null) {
                      final uri = Uri.parse(promo.buttonUrl!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    }
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 12),
              ],

              // -------------------------------
              // 5️⃣ CLOSE BUTTON
              // -------------------------------
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Close",
                  style: theme.titleMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
