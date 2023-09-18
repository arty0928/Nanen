import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/screens/calendar/calendar_screen.dart';
import 'package:wonders/ui/screens/mission/mission_home_screen.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/custom_page_route.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    required this.animationController,
    required this.animation,
    this.titleTxt = '',
    this.subTxt = '',
    super.key,
    required this.index,
  });

  final String titleTxt;
  final String subTxt;
  final AnimationController animationController;
  final Animation<double> animation;
  final int index;

  @override
  Widget build(BuildContext context) {
    dynamic destinationPage;

    // Determine the destination page based on the index
    switch (index) {
      case 1:
        destinationPage = ScreenPaths.mission;
        break;
      case 2:
        destinationPage = CalendarScreen(animationController: animationController);
        break;
      case 3:
        destinationPage = '';
        break;

      default:
        // You can provide a default action or handle other cases as needed
        destinationPage = ScreenPaths.mission;

        break;
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return Material(
          color: NanenAppTheme.background,
          child: FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(0.0, 30 * (1.0 - animation.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: NanenAppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: NanenAppTheme.lightText,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: subTxt.isNotEmpty,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {
                          if (destinationPage != '') {
                            appRouter.go(destinationPage);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                subTxt,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: NanenAppTheme.fontName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: NanenAppTheme.nearlyDarkBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 38,
                                width: 26,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: NanenAppTheme.darkText,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
