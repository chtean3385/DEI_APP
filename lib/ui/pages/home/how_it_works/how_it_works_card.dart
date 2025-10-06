import 'package:dei_champions/models/home/how_it_works/how_it_work_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class HowItWorkCard extends StatelessWidget {
  final HowItsWorkModel item;
  final int length;
  final int currentPage;

  const HowItWorkCard({
    required this.item,
    required this.length,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: BootstrapColors.colors["navy"] ?? Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.title ?? "",
                style: theme.bodyMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(length, (index) {
                  final isActive = currentPage == index;

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: isActive
                          ? (BootstrapColors.colors["orange"] ?? Colors.orange)
                          : Colors.grey.shade300,
                      child: Text(
                        (index + 1).toString(),
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              color: isActive ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  );
                }),
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
    return Container(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 14, width: 200),
              ),
              const SizedBox(height: 6),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 300),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 300),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {


                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor:  Colors.grey.shade300,
                      child: Text(
                        (index + 1).toString(),
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                          color:  Colors.white ,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
