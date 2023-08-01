import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/design_course/design_course_app_theme.dart';

class MissionTest2 extends StatefulWidget {
  const MissionTest2({Key? key}) : super(key: key);

  @override
  State<MissionTest2> createState() => _MissionTest2State();
}

class _MissionTest2State extends State<MissionTest2>
    with TickerProviderStateMixin {
  // TickerProviderStateMixin 추가
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DesignCourseAppTheme.nearlyWhite,
      child: GestureDetector(
        onVerticalDragDown: (_) {
          _isDragging = true;
        },
        onVerticalDragEnd: (_) {
          _isDragging = false;
        },
        onVerticalDragUpdate: (details) {
          if (_isDragging && details.delta.dy < 0) {
            // 아래에서 위로 드래그하는 경우에만 새로운 페이지로 이동
            _navigateToNewPage(context);
          }
        },
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
      ),
    );
  }

  void _navigateToNewPage(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final animationController = AnimationController(
      vsync: this, // TickerProviderStateMixin으로 구현되어야 함
      duration: const Duration(milliseconds: 500),
    );

    final animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward().then((_) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (context, animation, secondaryAnimation) {
            final double translateY = (1.0 - animation.value) * screenHeight;
            return Transform.translate(
              offset: Offset(0, -translateY),
              child: NewPage(),
            );
          },
        ),
      );
    });
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새로운 페이지'), // 새로운 페이지의 제목
      ),
      body: Center(
        child: Text('이곳은 새로운 페이지입니다.'),
      ),
    );
  }
}
