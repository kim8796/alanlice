
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {

 static PagesController get to => Get.find();
 RxInt pageIndex = 0.obs;
 GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 void changePageIndex(int index) => pageIndex.value = index;
 RxBool isCategoryPageOpen = false.obs;
 Future<bool> onWillPop() async {
  setCategoryPage(false);
  return !await navigatorKey.currentState!.maybePop();
 }

 void setCategoryPage(bool ck){
  isCategoryPageOpen(ck);
 }
 void back(){
  setCategoryPage(false);
  onWillPop();
 }

}
