import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/others/view_all_button.dart';

class RecruitersNoticingWidget extends StatelessWidget {
  final List<String> recruiters;

  const RecruitersNoticingWidget({super.key, required this.recruiters});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recruiters are noticing you", style: theme.titleMedium),
                  ViewAllButton(),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Horizontal scroll list
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recruiters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(4),bottomLeft: Radius.circular(4),bottomRight:Radius.circular(20) ),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(recruiters[index], style: theme.titleMedium),
                              const SizedBox(height: 4),
                              const Text(
                                "NVite sent",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
