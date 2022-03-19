import 'package:flutter/material.dart';

class BtmNaviChatlist extends StatelessWidget {
  const BtmNaviChatlist({Key? key}) : super(key: key);

  Widget _list() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
                (index) => Container(
              margin: const EdgeInsets.all(8),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryMenu(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _categoryMenu(context),
        Expanded(child: _list()),
      ],
    );
  }
}
