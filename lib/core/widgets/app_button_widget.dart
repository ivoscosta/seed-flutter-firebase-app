import 'package:flutter/material.dart';

import '../theme/colors.dart' as colors;

enum AppButtonStyle {
  text,
  outlined,
  contained,
}

class AppButton extends StatelessWidget {
  final AppButtonStyle style;
  final String text;
  final void Function() onPressed;
  final EdgeInsets? padding;
  final Color? fillColor;
  final Color? textColor;
  final BorderSide? borderSide;

  const AppButton({
    this.style = AppButtonStyle.contained,
    required this.text,
    required this.onPressed,
    this.padding,
    this.fillColor,
    this.textColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    if (style == AppButtonStyle.outlined)
      return OutlinedButton(
        onPressed: onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: textColor ?? colors.green,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          padding: MaterialStateProperty.all(
            padding ?? Theme.of(context).buttonTheme.padding,
          ),
          side: MaterialStateProperty.all(
            borderSide ?? BorderSide(color: colors.green),
          ),
        ),
      );

    if (style == AppButtonStyle.text)
      return TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: textColor,
                  decoration: TextDecoration.underline,
                ),
          ));

    return Material(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      color: fillColor ?? colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => onPressed(),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
