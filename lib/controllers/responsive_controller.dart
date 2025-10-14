import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController{
  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}