import 'package:wonders/common_libs.dart';

class MissionTest1 extends StatelessWidget {
  const MissionTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NanenAppTheme.nearlyWhite,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          // if (details.delta.dy < 0) {
          //   // 아래에서 위로 드래그하는 경우에만 새로운 페이지로 이동
          //   _navigateToNewPage(context);
          // }
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
                      color: NanenAppTheme.darkGrey,
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
                    color: NanenAppTheme.darkGrey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // void _navigateToNewPage(BuildContext context) => Navigator.push<dynamic>(
  //       context,
  //       CustomPageRoute(AxisDirection.up, child: SliverTopBar()),
  //     );
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
