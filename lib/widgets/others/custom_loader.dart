import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../constants/app_drawables.dart';

class CustomLoader extends StatelessWidget {
  final String? text;

  const CustomLoader({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(text?.isNotEmpty == true) Text(text !,style: theme.textTheme.bodyMedium),
        Image.asset(AppDrawables.appLoader,
            fit: BoxFit.contain),

      ],
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  final String? text;

  const SomethingWentWrong({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text ?? "Sorry.. Something went wrong. try again",
          maxLines: 3,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
class EmptyWidget extends StatelessWidget {
  final String? text;

  const EmptyWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text ?? "Sorry.. No data found",
          maxLines: 3,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
