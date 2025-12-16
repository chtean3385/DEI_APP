import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/providers.dart';

class SendResetLink extends ConsumerWidget {
  final VoidCallback onSendReset;

  const SendResetLink({
    super.key,
    required this.onSendReset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: state.isEmailValid ==true
              ? const [Color(0xFF667eea), Color(0xFF764ba2)] // active
              : [Colors.grey.shade400, Colors.grey.shade600],    // disabled
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF667eea).withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: state.restPageState == PageState.loading ? null : onSendReset,
          child: Center(
            child: state.restPageState == PageState.loading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Send Reset Link',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
