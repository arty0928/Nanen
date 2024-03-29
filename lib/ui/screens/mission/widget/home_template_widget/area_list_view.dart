import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';

class AreaListView extends StatefulWidget {
  const AreaListView({
    required this.mainScreenAnimationController,
    required this.mainScreenAnimation,
    super.key,
  });

  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;
  @override
  State<AreaListView> createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView> with TickerProviderStateMixin {
  List<String> areaListData = <String>[
    'assets/images/fitness_app/area2.png',
    'assets/images/fitness_app/area3.png',
    'assets/images/fitness_app/area1.png',
    'assets/images/fitness_app/area1.png',
  ];

  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                  ),
                  itemCount: areaListData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final int count = areaListData.length;
                    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController.forward();
                    return AreaView(
                        imagepath: areaListData[index],
                        animation: animation,
                        animationController: animationController,
                        onTap: () {
                          switch (index) {
                            case 0:
                              appRouter.go(ScreenPaths.wonderDetails(WonderType.greatWall, tabIndex: 0));
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MissionTest1()));
                              break;
                            case 1:
                              appRouter.go(ScreenPaths.wonderDetails(WonderType.petra, tabIndex: 1));
                              // Navigator.of(context).pushNamed('/Mission2');
                              break;
                            case 2:
                              appRouter.go(ScreenPaths.wonderDetails(WonderType.colosseum, tabIndex: 2));

                              break;
                            default:
                              appRouter.go(ScreenPaths.wonderDetails(WonderType.chichenItza, tabIndex: 3));

                              break;
                          }
                        });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    required this.imagepath,
    required this.animationController,
    required this.animation,
    this.onTap, // onTap 콜백 추가
    Key? key,
  }) : super(key: key);

  final String imagepath;
  final AnimationController animationController;
  final Animation<double> animation;
  final VoidCallback? onTap; // VoidCallback 타입으로 onTap 정의

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: NanenAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: NanenAppTheme.grey.withOpacity(0.4), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: NanenAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: onTap,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Image.asset(imagepath),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
