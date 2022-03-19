import 'package:get/get.dart';
import 'package:alanlice/controller/json_loader.dart';
import 'package:flutter/material.dart';

class UserInfo extends GetView<TextAnimation> {
  const UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.post!['firstName']!),
      ),
      body: Column(
        children: [
          Text(controller.post!['lastName']!),
          Column(
            children: [
              Text(
                controller.post!['phoneNumber']!,
              ),
              Text(
                controller.post!['homepage']!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}