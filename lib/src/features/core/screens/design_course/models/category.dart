import 'package:nanen/src/constants/image_strings.dart';

class Category {
  Category(
      {this.title = '',
      this.imagePath = '',
      this.lessonCount = 0,
      this.money = 0,
      this.rating = 0.0,
      this.url = ''});

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;
  String url;

  static List<Category> categoryList = <Category>[
    Category(
        imagePath: tBaekjoonImage,
        title: '백준',
        lessonCount: 24,
        money: 25,
        rating: 4.3,
        url: 'https://www.youtube.com/@emindyoga'),
    Category(
        imagePath: tYangbroImage,
        title: 'YangBro',
        lessonCount: 22,
        money: 18,
        rating: 4.6,
        url: 'https://www.youtube.com/@yangbro'),
    Category(
        imagePath: tCocoImage,
        title: '코코',
        lessonCount: 24,
        money: 25,
        rating: 4.3,
        url: 'https://www.youtube.com/@brainrich6'),
    Category(
        imagePath: tBrainrichImage,
        title: '뇌부자들',
        lessonCount: 22,
        money: 18,
        rating: 4.6,
        url: 'https://www.youtube.com/@brainrich6'),
  ];

  // 미션 카드
  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/fitness_app/area1.png',
      title: '차분한',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/fitness_app/area2.png',
      title: '활동적인',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/fitness_app/area3.png',
      title: '창의적인',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/fitness_app/area1.png',
      title: '친화적인',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
