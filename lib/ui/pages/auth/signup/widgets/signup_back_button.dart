import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/providers.dart';

class SignupBackButton extends ConsumerWidget {
  final bool isEmployer;
  const SignupBackButton({super.key,this.isEmployer = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = isEmployer
        ? ref.watch(employerSignupFlowControllerProvider)
        : ref.watch(signupFlowControllerProvider);
    return IconButton(
      visualDensity: VisualDensity.standard,
      icon: const Icon(Icons.arrow_back,color: Colors.black,),
      onPressed: state.isFirst ? Navigator.of(context).pop : (isEmployer
          ? ref.read(employerSignupFlowControllerProvider.notifier).previousStep : ref.read(signupFlowControllerProvider.notifier).previousStep),
    );
  }
}
