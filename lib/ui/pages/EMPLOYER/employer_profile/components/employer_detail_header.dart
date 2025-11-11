import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/others/rounded_network_image.dart';

class EmployerDetailHeader extends StatelessWidget {
  const EmployerDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _imageSection(),
        gapH8(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Vedhasekaran and Akalya Inc 123 ",
            style: theme.headlineMedium,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        gapH8(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Corrupti est qui c ",
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: theme.bodySmall?.copyWith(color: Colors.black54),
          ),
        ),
        gapH8(),
        _companyStats(),
      ],
    );
  }

  _imageSection() {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [_coverImage(), _profileImage()],
    );
  }

  Widget _profileImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.white,
        child: RoundedNetworkImage(
          imageUrl:
              "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120375/DEICHAMP/oh6xk6yndlo1ievdxi3y.jpg",
          height: 100,
          width: 100,
          borderRadius: 50,
        ),
      ),
    );
  }

  Widget _coverImage() {
    double height = 200;
    return SizedBox(
      height: height + 25,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: RoundedNetworkImage(
          height: height,
          width: double.infinity,
          imageUrl:
              "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120309/DEICHAMP/n1sby4rpjlz5lciwej85.jpg",
          borderRadius: 0,
        ),
      ),
    );
  }

  Widget _detailTiles(String value, String title) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: SizedBox(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: navigatorKey.currentContext!.textTheme.titleMedium
                    ?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: navigatorKey.currentContext!.textTheme.bodyMedium
                    ?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyStats() {
    final stats = [
      {'title': 'Employees', 'value': '51–200'},
      {'title': 'Countries', 'value': '12'},
      {'title': 'Founded', 'value': '2010'},
      {'title': 'Open Positions', 'value': '25+'},
    ];

    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = stats[index];
          return _detailTiles(item['value']!, item['title']!);
        },
      ),
    );
  }
}
