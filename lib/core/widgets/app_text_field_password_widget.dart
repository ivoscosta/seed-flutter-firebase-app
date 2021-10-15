import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../theme/colors.dart' as colors;
import 'app_text_field_widget.dart';

class AppTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;

  final bool? autofocus;
  final bool? error;
  final bool? enabled;
  final int? maxLength;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final String? counterText;
  final String? auxiliaryText;
  final String? titleText;
  final ValueChanged<String>? onSubmitted;
  final Function(String value) onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextAlign? textAlign;
  final void Function()? onEditingComplete;

  const AppTextFieldPassword({
    Key? key,
    required this.controller,
    this.titleText,
    this.hintText,
    this.autofocus = false,
    this.errorText,
    this.helperText,
    this.enabled,
    this.counterText,
    this.auxiliaryText,
    required this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.focusNode,
    this.decoration,
    this.error = false,
    this.textAlign,
    this.maxLength,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  _AppTextFieldPasswordState createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool _obscureText = true;
  Color _colorIcon = colors.gray;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: widget.decoration,
      hintText: widget.hintText,
      titleText: widget.titleText,
      autofocus: widget.autofocus ?? false,
      errorText: widget.errorText,
      textAlign: widget.textAlign,
      error: widget.error,
      maxLength: widget.maxLength,
      suffixIcon: _suffixIcon(),
      helperText: widget.helperText,
      enabled: widget.enabled,
      counterText: widget.counterText,
      auxiliaryText: widget.auxiliaryText,
      focusNode: widget.focusNode,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
    );
  }

  Widget _suffixIcon() {
    return GestureDetector(
      child: Icon(
        _obscureText ? UniconsLine.eye_slash : UniconsLine.eye,
        color: (widget.error ?? false) ? colors.alert : _colorIcon,
      ),
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
