import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/mission_data.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'package:wonders/ui/screens/editorial/editorial_screen.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/upload_image.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class MissionDetailScreen extends StatefulWidget {
  final int missionIndex;
  final MissionList selectedMission;
  final WonderData data;
  const MissionDetailScreen({super.key, required this.selectedMission, required this.data, required this.missionIndex});

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> with TickerProviderStateMixin {
  late UserInfoProvider userInfoProvider;

  final double infoHeight = 364.0;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  XFile? image;
  final ImagePicker picker = ImagePicker();

  late final AnimationController animationController;
  late final Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    checkImageIsExist();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> uploadAndSaveImage() async {
    // 갤러리에서 이미지를 선택하고 선택한 이미지를 변수에 저장
    var img = await picker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      setState(() {
        image = img;
      });

      // 이미지를 저장
      await saveImage(File(image!.path), widget.data);
    }
  }

  Future<void> checkImageIsExist() async {
    userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);
    userInfoProvider.getUserInfo();

    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory assetsDir = Directory(
      '${appDocDir.path}${Platform.pathSeparator}assets${Platform.pathSeparator}mission${Platform.pathSeparator}${widget.missionIndex}',
    );

    final String imagePath =
        '${assetsDir.path}${Platform.pathSeparator}${userInfoProvider.userName}${widget.data.title}${widget.selectedMission.missionTitle}.png';

    final File imageFile = File(imagePath);

    if (imageFile.existsSync()) {
      setState(() {
        image = XFile(imagePath);
      });
    } else {
      setState(() {
        image = null;
      });
    }
  }

  Future<void> saveImage(File image, WonderData data) async {
    // 애플리케이션 문서 디렉토리를 얻어옵니다.

    userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);
    userInfoProvider.getUserInfo();

    Directory appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir);

    // assets 폴더가 없다면 생성합니다.
    Directory assetsDir = Directory(
        '${appDocDir.path}${Platform.pathSeparator}assets${Platform.pathSeparator}mission${Platform.pathSeparator}${widget.missionIndex}');
    // print("widget.selectedMission");
    // print(widget.selectedMission);

    // print("widget.data.title");
    // print(widget.data.title);

    print(assetsDir);

    if (!assetsDir.existsSync()) {
      assetsDir.createSync(recursive: true);
    }

    // 이미지를 저장할 경로를 설정합니다.
    final String imagePath =
        '${assetsDir.path}${Platform.pathSeparator}${userInfoProvider.userName}${widget.data.title}${widget.selectedMission.missionTitle}.png';

    print("imagePath");
    print(imagePath);

    // 이미지를 지정된 경로에 복사합니다.
    await image.copy(imagePath);

    print('Image saved: $imagePath');
  }

  Future<void> loadImage(WonderData data) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    print(directory);
    final String path = directory.path;
    final String fileName = '${widget.data.type}.png';
    final File localImage = File('$path/$fileName');

    print("localImage");
    print(localImage);

    if (localImage.existsSync()) {
      // 저장된 이미지가 존재하면 해당 파일을 반환합니다.
      setState(() {
        image = XFile(localImage.path);
      });
    } else {
      // 저장된 이미지가 없으면 null을 반환합니다.
      setState(() {
        image = null;
      });
    }
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        opacity1 = 1.0;
      });
    }
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        opacity2 = 1.0;
      });
    }
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        opacity3 = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0;
    return Material(
      color: NanenAppTheme.nearlyWhite,
      child: Stack(
        children: <Widget>[
          // 사진 업로드
          Container(
            decoration: BoxDecoration(
              //이미지를 배경으로 설정
              image: image != null
                  ? DecorationImage(
                      image: FileImage(File(image!.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  // child: Image.asset('assets/images/design_course/webInterFace.png'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          surfaceTintColor: tActiveColor,
                          primary: widget.data.type.bgColor, // TextButton의 텍스트 색상 설정
                        ),
                        onPressed: () async {
                          // 갤러리에서 이미지를 선택하고 선택한 이미지를 변수에 저장
                          // var img = await picker.pickImage(source: ImageSource.gallery);
                          // setState(() {
                          //   image = img;
                          // });
                          await uploadAndSaveImage();
                        },
                        child: Text('Upload Photo'),
                      ),
                    ],
                  ),
                ),
                if (image != null)
                  Image(
                    image: FileImage(File(image!.path)),
                    fit: BoxFit.cover,
                    width: 100, // 이미지의 폭을 조절할 수 있어
                    height: 100, // 이미지의 높이를 조절할 수 있어
                  ),
              ],
            ),
          ),

          Positioned(
            top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: NanenAppTheme.nearlyWhite,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: NanenAppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: infoHeight, maxHeight: tempHeight > infoHeight ? tempHeight : infoHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 32.0, left: 18, right: 10),
                        child: Text(
                          widget.selectedMission.missionTitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              letterSpacing: 0.27,
                              color: widget.data.type.bgColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 3, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              // '40분동안 스트레칭을 해보세요!',
                              widget.data.subTitle,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 10,
                                letterSpacing: 0.27,
                                color: widget.data.type.bgColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: opacity1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: <Widget>[
                              getTimeBoxUI('24', 'Classes'),
                              getTimeBoxUI('2hours', 'Time'),
                              getTimeBoxUI('24', 'Seat'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                            child: Text(
                              'Learn modern web design with gamification aspects.Learn modern web design with gamification aspects.Learn modern web design with gamification aspects.Learn modern web design with gamification aspects.Learn modern web design with gamification aspects.Learn modern web design with gamification aspects.Learn modern web design with gamification aspects. From your fundamentals all the way up to masterclass.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                letterSpacing: 0.27,
                                color: NanenAppTheme.grey,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: opacity3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: widget.data.type.bgColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: widget.data.type.bgColor.withOpacity(0.5),
                                          offset: const Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        minimumSize: const Size(1000, 48),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'AI Diary',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          color: NanenAppTheme.nearlyWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //heart
          Positioned(
            top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
            right: 35,
            child: ScaleTransition(
              scale: CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
              child:
                  //card heart background
                  Card(
                color: image != null ? widget.data.type.bgColor : Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                elevation: 10.0,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        minimumSize: const Size(60, 60),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: NanenAppTheme.nearlyWhite,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //이전으로 가기 버튼
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: SizedBox(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: NanenAppTheme.nearlyBlack,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: NanenAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: NanenAppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: NanenAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: NanenAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void upLoadMissionPic() {
  print("upload");
}
