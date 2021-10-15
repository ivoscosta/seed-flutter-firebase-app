import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seed_flutter_app/core/widgets/app_progress_widget.dart';
import 'package:seed_flutter_app/core/utils/globals.dart' as globals;

import '../theme/colors.dart' as colors;

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String? coverAsset;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final bool? isUserPhoto;

  const AppNetworkImage({
    Key? key,
    this.imageUrl,
    this.coverAsset,
    this.width,
    this.height,
    this.borderRadius,
    this.isUserPhoto = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.gray,
        borderRadius: borderRadius ?? null,
      ),
      child: CachedNetworkImage(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height,
        imageUrl: isUserPhoto != null && isUserPhoto!
            ? imageUrl != null && imageUrl!.isNotEmpty
                ? imageUrl!
                : globals.DEFAULT_AVATAR_URL
            : imageUrl != null && imageUrl!.isNotEmpty
                ? imageUrl!
                : globals.DEFAULT_IMAGE,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: borderRadius ?? null,
          ),
        ),
        fit: BoxFit.cover,
        placeholder: (context, url) => AppProgress(),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          child: coverAsset != null
              ? Image.asset(
                  coverAsset!,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
