import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nanen/src/constants/image_strings.dart';

class TabCategory extends StatelessWidget {
  final tabCategory;
  const TabCategory({super.key, required this.tabCategory});

  @override
  Widget build(BuildContext context) {
    late var tab;

    List calm = [tCalm1Image1, tCalm1Image2, tCalm1Image3];
    List active = [
      tActiveImage1,
      tActiveImage2,
      tActiveImage3,
    ];

    switch (tabCategory) {
      case 'calm':
        tab = calm;
      case 'active':
        tab = active;
      default:
        tab = calm;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: MasonryGridView.builder(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(tab[index])),
            )),
      ),
    );
  }
}
