import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/ui/screens/mypage/top/widget/image_count.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class TabCategory extends StatefulWidget {
  final tabCategory;
  const TabCategory({super.key, required this.tabCategory});

  @override
  State<TabCategory> createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  late UserInfoProvider userInfoProvider;
  late List<File> activeImages = [];
  late List<File> calmImages = [];
  late List<File> creativeImages = [];
  late List<File> peopleImages = [];

  List<FileSystemEntity> imageFiles = [];

  @override
  void initState() {
    super.initState();
    print("여기는 마이페이지!!");
    _loadImages();
  }

  Future<void> _loadImages() async {
    userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);
    Directory appDocDir = await getApplicationDocumentsDirectory();

    // 디렉토리 경로를 가져오고, 이미지 파일을 읽어서 각 유형에 따라 분류합니다.
    Directory assetsDir = Directory(
        '${appDocDir.path}${Platform.pathSeparator}assets${Platform.pathSeparator}mission${Platform.pathSeparator}');

    print("assetsDir");
    print(assetsDir);

    if (assetsDir.existsSync()) {
      void getFilesRecursively(Directory dir) {
        dir.listSync().forEach((FileSystemEntity entity) {
          if (entity is File) {
            imageFiles.add(entity);
          } else if (entity is Directory) {
            getFilesRecursively(entity);
          }
        });
      }

      print('imageFiles');
      print(imageFiles);
      getFilesRecursively(assetsDir);

      for (var file in imageFiles) {
        if (file is File) {
          if (file.path.contains('${userInfoProvider.userName}')) {
            if (file.path.contains('Active')) {
              activeImages.add(file);
            } else if (file.path.contains('Calm')) {
              calmImages.add(file);
            } else if (file.path.contains('Creative')) {
              creativeImages.add(file);
            } else if (file.path.contains('People')) {
              peopleImages.add(file);
            }
          }
        }
      }

      // Provider.of<UserInfoProvider>(context, listen: false).setUserInfo(userName: userName, isLoggedIn: true);

      Provider.of<UserInfoProvider>(context, listen: false).setImageCount(
          activeCount: activeImages.length,
          calmCount: calmImages.length,
          creativeCount: creativeImages.length,
          peopleCount: peopleImages.length);

      // 이미지 파일을 저장된 시간 순서대로 정렬합니다.
      activeImages.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));
      calmImages.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));
      creativeImages.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));
      peopleImages.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));

      // 이미지가 준비되면 상태를 업데이트합니다.
      setState(() {});

      print('activeImages');
      print(activeImages);

      print('calmImages');
      print(calmImages);

      print('creativeImages');
      print(creativeImages);

      print('peopleImages');
      print(peopleImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    late List tab;

    List<File> images = [];

    if (widget.tabCategory == 'Active') {
      images = activeImages;
    } else if (widget.tabCategory == 'Calm') {
      images = calmImages;
    } else if (widget.tabCategory == 'Creative') {
      images = creativeImages;
    } else {
      images = peopleImages;
    }

    switch (widget.tabCategory) {
      case 'Active':
        tab = activeImages;
        break;
      case 'Calm':
        tab = calmImages;
        break;
      case 'Creative':
        tab = creativeImages;
        break;
      default:
        tab = peopleImages;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: MasonryGridView.builder(
        itemCount: tab.length,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.file(File(tab[index].path))),
            )),
      ),
    );
  }
}
