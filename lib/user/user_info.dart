import 'package:get/get.dart';
import 'package:alanlice/controller/json_loader.dart';
import 'package:flutter/material.dart';

class UserInfo extends GetView<TextAnimation> {
  const UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.post!['first_name']!),
      ),
      body: Column(
        children: [
          Text(controller.post!['last_name']!),
          Column(
            children: [
              Text(
                controller.post!['email']!,
              ),
              Text(
                controller.post!['address']!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}