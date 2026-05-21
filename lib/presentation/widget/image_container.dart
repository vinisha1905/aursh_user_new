import 'package:ayursh/domain/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget networkImageContainer({
  double? height,
  double? width,
  required String imageUrl,
  EdgeInsets? margin,
  BoxShape shape = BoxShape.rectangle,
  BorderRadiusGeometry? borderRadius,
  BoxFit? fit,
}) {
  return Padding(
    padding: margin ?? EdgeInsets.zero,
    child: ClipRRect(
      borderRadius: shape == BoxShape.circle ? BorderRadius.circular(100) : (borderRadius ?? BorderRadius.zero),
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: CachedNetworkImage(
          height: height,
          width: width ?? double.infinity,
          fit: fit ?? BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) {
            return Container(
              decoration: const BoxDecoration(
                color: primaryGreenColorForImage,
              ),
            );
          },
          errorWidget: (context, url, error) => Container(
            decoration: const BoxDecoration(
              color: primaryGreenColorForImage,
            ),
            child: Center(
              child: const Icon(Icons.error),
            ),
          ),
        ),
      ),
    ),
  );
}
