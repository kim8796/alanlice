import 'package:flutter/material.dart';
import 'package:alanlice/controller/json_loader.dart';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';

class BtmNaviHome extends StatelessWidget{
  // const BtmNaviHome({Key? key}) : super(key: key);
 // final controller = Get.find<JsonLoader>();
  final sController = Get.find<InfiniteScrollController>();
  // List _items = [];
  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('testJson/testjson.json');
  //   final data = await json.decode(response);
  //   this.setState((){
  //     _items = data["users"];
  //   });


  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(() =>
            Column(
              children: List.generate(
                  sController.sList.length,
                      (index) {
                    var post = sController.sList[index]
                        .map<String, String>((key, value) {
                      return MapEntry(key.toString(), value.toString());
                    });
                    return PostWidget(
                      first_name: post['first_name']!,
                      last_name: post['last_name']!,
                      email: post['email']!,
                      uid: post['uid']!,
                      address: post['address']!,
                      callBack: (){
                        Get.toNamed('/userInfo',parameters: post);
                      },

                    );
                  }
              ),
            )
        )
        );
  }
}

typedef PostClickFunction = void Function();

class PostWidget extends StatelessWidget {
  final String uid;
  final String first_name;
  final String last_name;
  final String email;
  final String address;
  final PostClickFunction callBack;

  const PostWidget({required this.uid,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.address,
    required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    first_name,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    last_name,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}