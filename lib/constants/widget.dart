
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:i_law/constants/themes.dart';

import 'color_constans.dart';




customCachedNetworkImage({String? url, BuildContext? context, BoxFit? boxFit}) {
  try {
    if (url == null || url == '') {
      return Container();
    } else {
      return Container(
        width: MediaQuery.of(context!).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
          imageUrl: url,
          fit: (boxFit) ?? BoxFit.contain,
          placeholder: (context, url) => Center(
            child: SpinKitChasingDots(
              color: customColor,
              size: 20,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
            : Icon(
          Icons.image,
          color: customColor,
        ),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}

Widget customFloatingActionButton(context,{Function()? onPress,String? text})
{
  return FloatingActionButton.extended(
      backgroundColor: customButtonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      onPressed: onPress,
      label: Container(
        width: MediaQuery.of(context).size.width/1.24,
        child: Center(child: customText(text!,color: Colors.white,
            fontWeight: FontWeight.bold)),
      ));
}

