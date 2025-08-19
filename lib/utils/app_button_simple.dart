import 'package:flutter/material.dart';


class AppButtonSimple extends StatelessWidget {
  const AppButtonSimple({
    super.key,
    this.title,
    this.onTap,
    this.isLoading = false,
    this.radius = 30,
     this.child
  });

  final String? title;
  final VoidCallback? onTap;
  final bool isLoading;
  final double radius;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder( borderRadius:  BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),),
        ),
        child: isLoading
            ?  SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              )
            : child != null ? child : Text(
                title ?? '',
                style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary),
              ),
      ),
    );
  }
}
