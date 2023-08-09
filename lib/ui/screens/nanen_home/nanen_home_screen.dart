import 'package:wonders/common_libs.dart';
import 'package:wonders/styles/tab_icon_data.dart';
import 'package:wonders/ui/screens/calendar/calendar_screen.dart';
import 'package:wonders/ui/screens/mission/widget/home_template.dart';
import 'package:wonders/ui/screens/mission/widget/mission_test1.dart';
import 'package:wonders/ui/screens/mypage/mypage.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart';
import 'package:wonders/utils/bottom_bar_view.dart';

class NanenHomeScreen extends StatefulWidget {
  const NanenHomeScreen({super.key});

  @override
  State<NanenHomeScreen> createState() => _NanenHomeScreenState();
}

class _NanenHomeScreenState extends State<NanenHomeScreen> with TickerProviderStateMixin {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Container(
    color: NanenAppTheme.background,
  );

  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    for (final TabIconData tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;
    tabBody = MyDiaryScreen(animationController: animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NanenAppTheme.background,
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Stack(
              children: <Widget>[
                tabBody,
                bottomBar(),
              ],
            );
          }
        },
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((_) {
                if (mounted) {
                  setState(() {
                    tabBody = MyDiaryScreen(animationController: animationController);
                  });
                }
                return;
              });
            }
            if (index == 1) {
              animationController.reverse().then<dynamic>((_) {
                if (mounted) {
                  setState(() {
                    // tabBody = const MissionTest1();
                    appRouter.go(ScreenPaths.mission);
                    // appRouter.go('/mission', extra: {
                    //   'animationController': animationController,
                    // });
                    // tabBody = MissionHomePage(
                    // animationController: animationController);
                  });
                }
                return;
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((_) {
                if (mounted) {
                  setState(() {
                    tabBody = CalendarScreen(animationController: animationController);
                    // tabBody = CalendarScreen(animationController: animationController);
                  });
                }
                return;
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((_) {
                if (mounted) {
                  setState(() {
                    // tabBody = MyPageScreen(animationController: animationController);
                    tabBody = MyPageScreen();
                  });
                }
                return;
              });
            }
          },
        ),
      ],
    );
  }
}
