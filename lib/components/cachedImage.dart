
import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/images.dart';
import 'package:flutter/material.dart';

Widget cachedImage({
  @required BuildContext context,
  @required String image,
  @required double height,
  @required double width,
  String placeholder = IMAGELINK,
  BoxFit fit = BoxFit.fill,
}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    fit: fit,
    errorWidget: (widget, text, error) {
      return cachedImage(
        context: context,
        image: placeholder,
        height: height,
        width: width,
      );
    },
    progressIndicatorBuilder: (context, url, progress) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(PRIMARYCOLOR),
            value: progress.progress,
          ),
        ),
      ],
    ),
    imageUrl: image,
  );
}
