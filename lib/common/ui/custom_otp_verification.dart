import 'package:flutter/material.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomOtpVerification extends StatefulWidget {
  final void Function(String)? onOtpChanged;

  const CustomOtpVerification({super.key, this.onOtpChanged});

  @override
  State<CustomOtpVerification> createState() => _CustomOtpVerificationState();
}

class _CustomOtpVerificationState extends State<CustomOtpVerification> {
  List<String> otp = List.filled(6, "");

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleOtpChange(String value, int index) {
    if (value.isNotEmpty) {
      otp[index] = value;
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else {
      otp[index] = '';
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }

    final combinedOtp = otp.join().trim();
    final isOtpComplete = otp.every((digit) => digit.trim().isNotEmpty);

    if (isOtpComplete) {
      FocusScope.of(context).unfocus();
    }

    widget.onOtpChanged?.call(combinedOtp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return Flexible(
          child: SizedBox(
            width: 52,
            height: 52,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.of(context).white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.of(context).primaryYellow,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => _handleOtpChange(value, index),
            ),
          ),
        );
      }),
    );
  }
}
