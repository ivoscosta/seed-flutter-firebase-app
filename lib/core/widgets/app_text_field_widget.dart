import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart' as colors;

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? hintText;
  final bool autofocus;
  final String? errorText;
  final String? titleText;
  final String? helperText;
  final String? counterText;
  final String? auxiliaryText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final bool? error;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextCapitalization? textCapitalization;

  const AppTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.titleText,
    this.autofocus = false,
    this.errorText,
    this.auxiliaryText,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.helperText,
    this.counterText,
    this.onChanged,
    this.enabled = true,
    this.textInputAction,
    this.onSubmitted,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.margin,
    this.decoration,
    this.error,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.textCapitalization,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: _getTitleAlign(textAlign),
        children: <Widget>[
          _getTitleText(context, minLines),
          TextField(
            inputFormatters: inputFormatters,
            minLines: minLines,
            keyboardType: keyboardType,
            autofocus: autofocus,
            maxLength: maxLength,
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            focusNode: focusNode,
            enabled: enabled,
            textAlign: textAlign ?? TextAlign.start,
            style: textStyle ??
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            onSubmitted: this.onSubmitted,
            textInputAction: this.textInputAction,
            maxLines: maxLines,
            onEditingComplete: onEditingComplete,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            decoration: decoration ??
                InputDecoration(
                  disabledBorder: _getDisableBorder(context),
                  enabledBorder: _getEnabledBorder(context),
                  focusedBorder: _getFocusBorder(context),
                  hintStyle: _getHintStyle(context),
                  counterText: counterText,
                  helperText: helperText,
                  suffixIconConstraints: BoxConstraints(),
                  prefixIconConstraints: BoxConstraints(),
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  errorMaxLines: 3,
                  helperMaxLines: 3,
                  hintText: hintText,
                ),
            buildCounter: (
              _, {
              int? currentLength,
              int? maxLength,
              bool? isFocused,
            }) =>
                null,
          ),
        ],
      ),
    );
  }

  CrossAxisAlignment _getTitleAlign(TextAlign? textAlign) {
    if (textAlign == null) {
      return CrossAxisAlignment.start;
    }
    if (textAlign == TextAlign.center) {
      return CrossAxisAlignment.center;
    }

    if (textAlign == TextAlign.start) {
      return CrossAxisAlignment.start;
    }
    if (textAlign == TextAlign.end) {
      return CrossAxisAlignment.end;
    }
    return CrossAxisAlignment.start;
  }

  Widget _getTitleText(BuildContext context, int? minLines) {
    if (titleText == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(bottom: (minLines ?? 0) * 3.0),
      child: Text(
        titleText!,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  InputBorder? _getDisableBorder(BuildContext context) {
    if (error == null || !error!)
      return Theme.of(context).inputDecorationTheme.disabledBorder;

    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: colors.alert,
      ),
    );
  }

  InputBorder? _getEnabledBorder(BuildContext context) {
    if (error == null || !error!)
      return Theme.of(context).inputDecorationTheme.enabledBorder;

    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: colors.alert,
      ),
    );
  }

  InputBorder? _getFocusBorder(BuildContext context) {
    if (error == null || !error!)
      return Theme.of(context).inputDecorationTheme.focusedBorder;

    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: colors.alert,
      ),
    );
  }

  TextStyle? _getHintStyle(BuildContext context) {
    if (error == null || !error!)
      return Theme.of(context).inputDecorationTheme.hintStyle;

    return TextStyle(
      color: colors.alert,
      fontSize: 16.0,
      letterSpacing: 0.15,
    );
  }
}
