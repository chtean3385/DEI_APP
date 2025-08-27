import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/providers.dart';

class SignupBackButton extends ConsumerWidget {
  const SignupBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(signupFlowControllerProvider.notifier);
    final state = ref.watch(signupFlowControllerProvider);

    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: state.isFirst ? null : controller.previousStep,
    );
  }
}
