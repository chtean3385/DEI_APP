import 'package:flutter/material.dart';

class StarRatingDisplay extends StatelessWidget {
  final double rating; // use double for fractional ratings
  final int starCount;
  final double size;
  final Color color;

  const StarRatingDisplay({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size = 24,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (rating >= index + 1) {
          // full star
          return Icon(Icons.star, color: color, size: size);
        } else if (rating > index && rating < index + 1) {
          // half star
          return Icon(Icons.star_half, color: color, size: size);
        } else {
          // empty star
          return Icon(Icons.star_border, color: color, size: size);
        }
      }),
    );
  }
}