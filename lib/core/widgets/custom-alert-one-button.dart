import 'package:flutter/material.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';

class CustomAlertOneButton extends StatelessWidget {
  final String? title, text, imageAsset, buttonLabel;
  final Function onPressed;

  CustomAlertOneButton(
      {required this.title,
      required this.text,
      this.imageAsset,
      required this.buttonLabel,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(marginSide),
              child: Column(
                children: <Widget>[
                  SizedBox(height: marginSide),
                  imageAsset != null
                      ? Image.asset(
                          imageAsset!,
                          height: 80,
                        )
                      : SizedBox(),
                  SizedBox(height: imageAsset != null ? 24.0 : 0),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: marginSide),
                  Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 8),
                ],
              )),
          Column(
            children: <Widget>[
              Divider(),
              SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: InkWell(
                      onTap: () {
                        onPressed(); // To close the dialog
                      },
                      child: Center(
                        child: Text(
                          buttonLabel!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button,
                        ),
                      ))),
              SizedBox(height: 6),
            ],
          )
        ],
      ),
    );
  }
}
