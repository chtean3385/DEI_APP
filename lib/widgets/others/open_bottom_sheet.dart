import 'package:flutter/material.dart';

Future<void> openEditBottomSheet({
  required BuildContext context,
  required Widget content,
  double minChildSize = 0.5,
  double maxChildSize = 0.95,
  double initialChildSize = 0.85,
  bool isDraggable = false,
}) {
  if (!isDraggable) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      builder: (ctx) => Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom, // pushes content above keyboard
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          clipBehavior: Clip.antiAlias,child: content),
    );
  } else {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom, // pushes content above keyboard
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                controller: scrollController,
                child: content,
              ),
            );
          },
        );
      },
    );
  }
}
