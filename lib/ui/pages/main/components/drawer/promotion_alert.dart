import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../providers/providers.dart';


class HomePromotionDialog extends StatelessWidget {
  const HomePromotionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Consumer(
      builder: (context, ref, _) {
        final promo = ref.watch(popupAlertProvider).data;

        if (promo == null) return const SizedBox.shrink();

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // -------------------------------
              // MAIN IMAGE CARD
              // -------------------------------
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RoundedNetworkImage(
                  imageUrl: promo.imageUrl ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),

              // -------------------------------
              // OPTIONAL BUTTON OVER IMAGE
              // -------------------------------
              if (promo.link != null && promo.link!.isNotEmpty)
                Positioned(
                  bottom: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(visualDensity: VisualDensity.compact,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () async {
                      final uri = Uri.parse(promo.link!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      "View Now",
                      style: theme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // -------------------------------
              // CLOSE ICON BELOW IMAGE
              // -------------------------------
              Positioned(
                bottom: -50,
                child: Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 4,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


