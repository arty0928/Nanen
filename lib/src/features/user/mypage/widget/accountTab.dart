import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  final tabColor;
  final itemCount;

  const AccountTab(
      {super.key, required this.tabColor, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, index) {
          return Container(color: tabColor);
        });
  }
}
