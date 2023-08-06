import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wonders/styles/colors.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/mission_detail_screen.dart';

class MissionHomePage extends StatefulWidget {
  const MissionHomePage({
    required this.animationController,
    Key? key, // 'Key?' 타입으로 변경
  }) : super(key: key); // 'super.key' 추가

  final AnimationController animationController;

  @override
  State<MissionHomePage> createState() => _MissionHomePageState();
}

class _MissionHomePageState extends State<MissionHomePage> with TickerProviderStateMixin {
  late final ScrollController scrollController;

  List<Widget> listViews = <Widget>[];
  late final Animation<double> topBarAnimation;
  double topBarOpacity = 0.0;

  late Category category;
  late AnimationController animationController;
  late Animation<double> animation;

  //dots_indicator
  late PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 1.0;
            });
          }
        }
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          if (mounted) {
            setState(() {
              topBarOpacity = scrollController.offset / 24;
            });
          }
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 0.0;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addAllListData() {
    const int count = 6;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NanenAppTheme.background,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            itemCount: 10000,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                alignment: Alignment.center,

                // color: _getPageColor(pageIndex),
                // child: const MissionTest1(),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: DotsIndicator(
                dotsCount: 4,
                position: currentPageIndex.toInt() % 4,
                // position: currentPageIndex % 4,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  activeColor: NanenAppTheme.nearlyDarkBlue,
                  color: NanenAppTheme.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }

  String _getPageBackgroundImage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 'assets/images/fitness_app/area1.png';
      case 1:
        return 'assets/images/fitness_app/area2.png';
      case 2:
        return 'assets/images/fitness_app/area3.png';
      case 3:
        return 'assets/images/fitness_app/area1.png';
      default:
        return '';
    }
  }

  Color _getPageColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return NanenAppTheme.darkGrey;
      case 1:
        return NanenAppTheme.nearlyBlue;
      case 2:
        return NanenAppTheme.nearlyDarkBlue;
      case 3:
        return NanenAppTheme.grey;
      default:
        return Colors.transparent;
    }
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const CourseInfoScreen(),
      ),
    );
  }
}
