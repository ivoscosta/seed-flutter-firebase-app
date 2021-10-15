import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';

import '../theme/colors.dart' as colors;

class AppProgress extends StatelessWidget {
  final bool? circular;

  const AppProgress({
    Key? key,
    this.circular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      lineWidth: 2,
      duration: Duration(milliseconds: 800),
      color: colors.gray,
      size: loadingSize,
    );
  }
}
