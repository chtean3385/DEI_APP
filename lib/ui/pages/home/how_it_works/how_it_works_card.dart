import 'package:dei_champions/models/home/how_it_works/how_it_work_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../../../widgets/others/view_all_button.dart';

class HowItWorkCard extends StatelessWidget {
  final HowItsWorkModel item;

  const HowItWorkCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:  (BootstrapColors.colors["lightNavy"] ?? Colors.white),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.title ?? "",
                style: theme.bodyMedium?.copyWith(color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              const SizedBox(height: 6),

              Text(
                item.description ?? "",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerHowItWorkCard extends StatelessWidget {
  const ShimmerHowItWorkCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:14,width: 150,
                ),
              ),
              const SizedBox(height: 6),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 200,
                ),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: SizedBox(
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedNetworkImage(
                imageUrl: "",
                width: 50,
                height: 50,
                borderRadius: 8,
              ),
              const SizedBox(height: 12),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:14,width: 100,
                ),
              ),

              const SizedBox(height: 6),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 170,
                ),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 150,
                ),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 170,
                ),
              ),
              const SizedBox(height: 12),

              ViewAllButton(text: 'View jobs', isSmall: true),
            ],
          ),
        ),
      ),
    );
  }
}
