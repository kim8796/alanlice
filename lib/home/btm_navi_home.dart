import 'package:flutter/material.dart';
import 'package:alanlice/controller/json_loader.dart';
import 'package:get/get.dart';

class BtmNaviHome extends StatelessWidget{
  // const BtmNaviHome({Key? key}) : super(key: key);
  final controller = Get.find<JsonLoader>();

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
                  controller.list.length,
                      (index) {
                    var post = controller.list[index]
                        .map<String, String>((key, value) {
                      return MapEntry(key.toString(), value.toString());
                    });
                    return PostWidget(
                      firstname: post['firstName']!,
                      lastname: post['lastName']!,
                      phonenumber: post['phoneNumber']!,
                      uid: post['userId']!,
                      homepage: post['homepage']!,
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
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String homepage;
  final PostClickFunction callBack;

  const PostWidget({required this.uid,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.homepage,
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
                    firstname,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    lastname,
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