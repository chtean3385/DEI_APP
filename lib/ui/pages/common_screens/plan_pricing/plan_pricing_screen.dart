import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/plan_price_view.dart';

class PlanPricingScreen extends StatelessWidget {
  const PlanPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        title: "Plan And Pricing",
        arrowLeft: true,
        titleStyleSmall: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredBox(
              color: AppColors.bg,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Employer Plans",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      gapH8(),
                      Text(
                        "Choose The Best Plan For Your Hiring Needs",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: PlanPriceView()),
          ],
        ),
      ),
    );
  }
}
