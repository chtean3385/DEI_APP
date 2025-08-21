import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputFields extends StatelessWidget {
  final List<TextEditingController> otpControllers;
  final List<FocusNode> focusNodes;
  final Function(int index, String value) onChanged;

  const OTPInputFields({
    super.key,
    required this.otpControllers,
    required this.focusNodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return OTPInputField(
          controller: otpControllers[index],
          focusNode: focusNodes[index],
          onChanged: (value) => onChanged(index, value),
        );
      }),
    );
  }
}

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const OTPInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: controller.text.isEmpty
              ? Colors.grey.shade300
              : const Color(0xFF667eea),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D3748),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged,
      ),
    );
  }
}