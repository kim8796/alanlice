import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
          .loadString("assets/testjson/testjson.json");
      list(json.decode(data).cast<Map<String, dynamic>>().toList());
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