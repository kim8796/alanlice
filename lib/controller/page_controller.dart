
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {

 static PagesController get to => Get.find();
 RxInt pageIndex = 0.obs;
 GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 void changePageIndex(int index) => pageIndex.value = index;
 Future<bool> onWillPop() async {
  return !await navigatorKey.currentState!.maybePop();
 }
 void back(){
  onWillPop();
 }

}
