import 'package:flutter/material.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';

class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = Colors.grey,
    this.endColor = Colors.grey,
    this.star = '5.0',
    this.url = '',
  });

  String imagePath;
  String titleTxt;
  Color startColor;
  Color endColor;
  String star;
  String url;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
        imagePath: tYoutuber1,
        titleTxt: '뇌부자',
        startColor: const Color(0xFFFE95B6),
        endColor: const Color(0xFFFF5287),
        star: '4.3',
        url: tYoutuberURL1),
    MealsListData(
        imagePath: tYoutuber2,
        titleTxt: '에일린 \nmind Yoga',
        startColor: const Color(0xFF738AE6),
        endColor: const Color(0xFF5C5EDD),
        star: '4.5',
        url: tYoutuberURL2),
    MealsListData(
        imagePath: tYoutuber3,
        titleTxt: '양브로의 \n정신세계',
        startColor: const Color(0xFFFA7D82),
        endColor: const Color(0xFFFFB295),
        star: '4.3',
        url: tYoutuberURL3),

    // MealsListData(
    //   imagePath: tYoutuber3,
    //   titleTxt: 'Dinner',
    //   startColor: const Color(0xFF6F72CA),
    //   endColor: const Color(0xFF1E1466),
    // ),
  ];
}
