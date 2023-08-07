import 'package:flutter/material.dart';

class MyPageNumbers extends StatelessWidget {
  const MyPageNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'djdropthebeat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '10',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text('active')
                ],
              ),
              Column(
                children: [
                  Text(
                    '14',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text('calm')
                ],
              ),
              Column(
                children: [
                  Text(
                    '17',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text('creative')
                ],
              ),
              Column(
                children: [
                  Text(
                    '9',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text('people')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
