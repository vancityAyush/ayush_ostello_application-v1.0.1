import 'package:ayush_s_application5/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

IconButton buildBackButton() {
  return IconButton(
    padding: EdgeInsets.only(
      top: 37.v,
      left: 2.h,
      bottom: 34.v,
    ),
    splashRadius: 35.adaptSize,
    icon: Icon(
      Icons.arrow_back_ios,
      color: Color(0xffCBCED5),
      size: 32.adaptSize,
    ),
    onPressed: () {},
  );
}
