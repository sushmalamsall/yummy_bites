import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yummy_bites/theme/app_colors.dart';

enum CustomTextFormFieldLabelMode { label, hint, both }

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  final bool isRequired;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? enabled;
  final CustomTextFormFieldLabelMode mode;
  final List<TextInputFormatter>? inputFormatters;
  final IconData prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.inputTextStyle,
    this.controller,
    this.obscureText = false,
    this.isPassword = false,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.enabled,
    this.mode = CustomTextFormFieldLabelMode.both,
    this.inputFormatters,
    required this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String text = "";
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    text = widget.initialValue ?? widget.controller?.text ?? "";
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final isEnabled = widget.enabled ?? true;

    final Color iconColor = (isFocused || text.isNotEmpty)
        ? AppColors.of(context).primaryYellow
        : Colors.grey;

    return TextFormField(
      focusNode: _focusNode,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {
          text = value;
        });
      },

      cursorColor: AppColors.of(context).primaryYellow,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword,
      keyboardType: widget.keyboardType,
      enabled: isEnabled,
      style:
          widget.inputTextStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.of(context).primaryYellow,
          ),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(widget.prefixIcon, color: iconColor),
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.of(context).white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: AppColors.of(context).white,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
