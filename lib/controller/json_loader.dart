import 'dart:developer';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
class JsonLoader extends GetxController {
  static JsonLoader get to => Get.find();
  var list = <Map<String, dynamic>>[].obs;
  @override
  void onInit() async {
    super.onInit();
    _loadJsonFile();
  }
  void _loadJsonFile() async {
    if (Get.context != null) {
      String data = await DefaultAssetBundle.of(Get.context!)
          .loadString("assets/testjson/csvjson.json");
      list.value = await json.decode(data).cast<Map<String, dynamic>>().toList();
      // log(data);
      // print(data);

      //list(json.decode(data).cast<Map<String, dynamic>>().toList());


    } else {
      Future.delayed(Duration(milliseconds: 200), _loadJsonFile);
    }
  }



}


class TextAnimation extends GetxController {
  Map<String, String?>? post;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    post = Get.parameters;
  }
}



class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;
  var isLoading = false.obs;
  var hasMore = false.obs;
  var isShow = false.obs;

  var offset = 20.obs;
  var pages = 0.obs;
  var list = <Map<String, dynamic>>[].obs;
  var sList = <Map<String, dynamic>>[].obs;
  @override
  void onInit(){
    _getData();
  }

  _getDataMore() async{

    pages.value = pages.value + 1;


    var appendData = List<Map<String,dynamic>>.generate(offset.value, (i) => list[i+(pages.value*offset.value)]);

    sList.value.addAll(appendData);

    isLoading.value = false;

    hasMore.value =  sList.length < list.length;
}

  _getData() async {
    isLoading.value = true;

    if (Get.context != null) {
      String data = await DefaultAssetBundle.of(Get.context!)
          .loadString("assets/testjson/csvjson.json");
      list.value = await json.decode(data).cast<Map<String, dynamic>>().toList();

    } else {
      Future.delayed(Duration(milliseconds: 200), _getData);
    }

    var appendData = List<Map<String,dynamic>>.generate(offset.value, (i) => list[i+(pages.value*offset.value)]);


    sList.value.addAll(appendData);

    isLoading.value = false;

    hasMore.value =  sList.length < list.length;

  }

  reload() async {
    pages.value = 0;
    var isLoading = false.obs;
    var hasMore = false.obs;
    var isShow = false.obs;
    list.clear();
    sList.clear();
    _getData();
  }
}