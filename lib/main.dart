import 'package:alanlice/chatlist/btm_navi_chatlist.dart';
import 'package:alanlice/controller/json_loader.dart';
import 'package:alanlice/home/btm_navi_home.dart';
import 'package:alanlice/setting/btm_navi_setting.dart';
import 'package:alanlice/user/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alanlice/controller/page_controller.dart';
//import 'package:freezed/builder.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(PagesController());
        // Get.put(JsonLoader());
      //  Get.lazyPut(() => JsonLoader());
        Get.put(InfiniteScrollController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      getPages: [
        GetPage(name: '/userInfo', page: ()=>const UserInfo() , binding: BindingsBuilder((){
          Get.put(TextAnimation());
        })),
      ],
    );
  }
}

class MyHomePage extends GetView<PagesController> {
  @override
  MyHomePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(()=>Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('alanlice'),
        ),
        body: IndexedStack(
          index: controller.pageIndex.value,
          children:[
            BtmNaviHome(),
            const BtmNaviChatlist(),
            const BtmNaviSetting(),
          ],
          ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.pageIndex.value,
        onTap: controller.changePageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.grey),
            label: 'home',
            activeIcon: Icon(Icons.people, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.grey),
            label: 'chat',
            activeIcon: Icon(Icons.chat_bubble_outline, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.grey),
            label: 'settings',
            activeIcon: Icon(Icons.settings, color: Colors.blue),
          ),
        ],
      ),
      ),
      ),
    );

  }
}
