import 'package:flutter/material.dart';

import 'color_constans.dart';

class AppTheme {
  static final TextStyle heading = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    // letterSpacing: 1.2,
    color: Colors.black,
  );
  static final TextStyle headingColorBlue = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    // letterSpacing: 1.2,
    color: sliderTextColor,
  );
  static final TextStyle subHeading = const TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: Colors.black,
  );
  static final TextStyle subHeadingColorBlue = const TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: sliderTextColor,
  );
  static final containerBackground = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xfff4DC0B1),
      const Color(0xfff2aa293),
    ],
  );
}

///////////////////////////////////////////////////////////////////////////
InputDecoration textFormInputDecorationForPassword(
    IconData icon, String label, Function() obscureText, bool obscurepasswrod,
    {String? error}
    ) {
  return InputDecoration(
    hintText: label,
    errorText: error,
    hintStyle: TextStyle(color:customTextColor.withOpacity(0.5) ),
    isDense: true,
    prefixIcon: const Icon(Icons.lock),
    contentPadding: const EdgeInsets.all(10),
    suffixIcon: IconButton(
      onPressed: obscureText,
      icon: obscurepasswrod
          ? Icon(
              icon,
              color: customColorGray,
            )
          : const Icon(
              Icons.visibility,
              color: customColorGray,
            ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////
InputDecoration textFormInputDecoration(
  IconData icon,
  String label,
{String? error,}
) {
  return InputDecoration(
    errorText: error,
    errorStyle: AppTheme.subHeading.copyWith(
      color: customColor,
    ),
    hintText: label,
    hintStyle: AppTheme.heading.copyWith(
      color: customColorGray,
      fontSize: 14,
    ),
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(10),
    suffixIcon: Icon(
      icon,
      color: customColorGray,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: customColorGray,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: customColorGray,
      ),
    ),
  );
}

InputDecoration textFormInpuofEidtProfile({
  IconData? icon,
  String? hintText,
}) {
  return InputDecoration(
    errorStyle: AppTheme.subHeading.copyWith(
      color: customColor,
    ),
    fillColor: Colors.white,
    hintText: hintText ?? "",
    // filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(10),
    suffixIcon: Icon(
      icon,
      color: customColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: customColorGray,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: customColorGray,
      ),
    ),
  );
}

///////////////////////////////////////////////////////////////
InputDecoration conectedTextFormStyle({String? lableText}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: customColor),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: customColor),
      gapPadding: 10,
    ),
    // suffixIcon: Icon(
    //   Icons.edit,
    //   color: customColor,
    // ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    labelStyle: AppTheme.heading.copyWith(
      color: customColor,
    ),
    labelText: lableText,
  );
}

Widget customText(String text,
    {Color color = customTextColor, FontWeight fontWeight = FontWeight.w500,
      TextDecoration? decoration,
      TextAlign?textAlign,
      int?max,
      TextOverflow? overflow ,
    double size=14}) {
  return Text(
    text,
    maxLines: max,
    overflow: overflow,
    textAlign: textAlign,
    style:
        TextStyle(color: color, fontFamily: "Poppins", fontWeight: fontWeight,
        fontSize: size,decoration: decoration,),
  );
}
/////////////////////////////////////////////////////////
