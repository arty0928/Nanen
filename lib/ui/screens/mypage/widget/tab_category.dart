import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';

class TabCategory extends StatelessWidget {
  final tabCategory;
  const TabCategory({super.key, required this.tabCategory});

  @override
  Widget build(BuildContext context) {
    late List tab;

    List calm = [tCalm1Image1, tCalm1Image2, tCalm1Image3];
    List active = [
      tActiveImage1,
      tActiveImage2,
      tActiveImage3,
      tActiveImage1,
      tActiveImage2,
      tActiveImage3,
      tCalm1Image1,
      tCalm1Image2,
      tCalm1Image3
    ];

    switch (tabCategory) {
      case 'calm':
        tab = calm;
        break;
      case 'active':
        tab = active;
        break;
      default:
        tab = calm;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: MasonryGridView.builder(
        itemCount: tab.length,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(tab[index])),
            )),
      ),
    );
  }
}
