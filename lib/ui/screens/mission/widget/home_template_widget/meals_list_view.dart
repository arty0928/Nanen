import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/screens/home/data/meals_list_data.dart';

class MealsListView extends StatefulWidget {
  const MealsListView({
    required this.mainScreenAnimationController,
    required this.mainScreenAnimation,
    super.key,
  });

  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;

  @override
  State<MealsListView> createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView> with TickerProviderStateMixin {
  List<MealsListData> mealsListData = MealsListData.tabIconsList;

  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
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
        return SizedBox(
          height: 120,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 16),
            itemCount: mealsListData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final int count = mealsListData.length > 10 ? 10 : mealsListData.length;
              final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animationController, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
              animationController.forward();

              return MealsView(
                mealsListData: mealsListData[index],
                animation: animation,
                animationController: animationController,
              );
            },
          ),
        );

        // FadeTransition(
        //   opacity: widget.mainScreenAnimation,
        //   child: Transform(
        //     transform: Matrix4.translationValues(
        //         0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
        //     child: SizedBox(
        //       height: 216,
        //       width: double.infinity,
        //       child: ListView.builder(
        //         padding: const EdgeInsets.only(right: 16, left: 16),
        //          final int count =
        //               mealsListData.length > 10 ? 10 : mealsListData.length;
        //           final Animation<double> animation =
        //         );
        //         },
        //       ),
        //     ),
        //   ),
        // );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView({
    required this.mealsListData,
    required this.animationController,
    required this.animation,
    super.key,
  });

  final MealsListData mealsListData;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return GestureDetector(
          onTap: () async {
            var url = mealsListData.url;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
              child: SizedBox(
                width: 200,
                // width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: mealsListData.endColor.withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: <Color>[mealsListData.startColor, mealsListData.endColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    // height: double.infinity,
                                    child: Image.asset(mealsListData.imagePath),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        mealsListData.titleTxt,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontFamily: NanenAppTheme.fontName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 0.2,
                                          color: NanenAppTheme.white,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            mealsListData.star,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: 'writerFont',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              letterSpacing: 0.27,
                                              color: NanenAppTheme.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: NanenAppTheme.nearlyDarkBlue,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
