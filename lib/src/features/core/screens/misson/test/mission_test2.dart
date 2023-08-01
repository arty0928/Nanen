import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/design_course/design_course_app_theme.dart';

class MissionTest2 extends StatefulWidget {
  const MissionTest2({super.key});

  @override
  State<MissionTest2> createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<MissionTest2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset('assets/design_course/webInterFace.png'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: SizedBox(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: DesignCourseAppTheme.nearlyBlack,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
