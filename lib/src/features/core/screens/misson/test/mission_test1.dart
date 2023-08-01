import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/fitness_app_theme.dart';
import 'package:nanen/src/features/core/screens/design_course/design_course_app_theme.dart';
import 'package:nanen/src/utils/animations/customPageRoute.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SliverTopBar extends StatefulWidget {
  const SliverTopBar({super.key});

  @override
  State<SliverTopBar> createState() => _MissionTest1State();
}

class _MissionTest1State extends State<SliverTopBar> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.17;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.75;

    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        parallaxEnabled: true, //SlidingUpPanel 을 올려도 위에 backgroundImage 보이게
        parallaxOffset: .5,
        body: Image.asset('assets/fitness_app/area1.png'),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  const PanelWidget(
      {super.key, required this.controller, required this.panelController});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        const SizedBox(
          height: 16,
        ),
        buildDragHandle(),
        const SizedBox(
          height: 18,
        ),
        buildAboutText(),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Widget buildAboutText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
              'New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~New york ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'),
        ],
      ),
    );
  }

  Widget buildDragHandle() => GestureDetector(
        onTap: togglePanel,
        child: Center(
          child: Container(
            width: 34,
            height: 7,
            decoration: BoxDecoration(
                color: FitnessAppTheme.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      // ? Navigate.po
      : panelController.open();
}

class MissionTest1 extends StatelessWidget {
  const MissionTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DesignCourseAppTheme.nearlyWhite,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < 0) {
            // 아래에서 위로 드래그하는 경우에만 새로운 페이지로 이동
            _navigateToNewPage(context);
          }
        },
        child: Stack(
          children: <Widget>[
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
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/fitness_app/area1.png', // 중앙에 위치할 이미지 경로 입력
                    width: 300, // 이미지의 너비
                    height: 300, // 이미지의 높이
                  ),
                  const SizedBox(height: 30),
                  const Icon(
                    Icons.arrow_downward,
                    size: 40,
                    color: FitnessAppTheme.darkGrey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToNewPage(BuildContext context) => Navigator.push<dynamic>(
        context,
        CustomPageRoute(AxisDirection.up, child: SliverTopBar()),
      );
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
