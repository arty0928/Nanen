import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/common/fade_color_transition.dart';
import 'package:wonders/ui/wonder_illustrations/common/illustration_piece.dart';
import 'package:wonders/ui/wonder_illustrations/common/wonder_illustration_builder.dart';
import 'package:wonders/ui/wonder_illustrations/common/wonder_illustration_config.dart';

class ChichenItzaIllustration extends StatelessWidget {
  ChichenItzaIllustration({Key? key, required this.config}) : super(key: key);
  final WonderIllustrationConfig config;
  final assetPath = WonderType.chichenItza.assetPath;
  final fgColor = WonderType.chichenItza.fgColor;
  @override
  Widget build(BuildContext context) {
    return WonderIllustrationBuilder(
      config: config,
      bgBuilder: _buildBg,
      mgBuilder: _buildMg,
      fgBuilder: _buildFg,
      wonderType: WonderType.chichenItza,
    );
  }

  List<Widget> _buildBg(BuildContext context, Animation<double> anim) {
    return [
      FadeColorTransition(animation: anim, color: fgColor),
      IllustrationPiece(
        fileName: 'sun.png',
        initialOffset: Offset(0, 50),
        enableHero: true,
        heightFactor: .4,
        minHeight: 200,
        fractionalOffset: Offset(.55, config.shortMode ? .2 : -.35),
      ),
    ];
  }

  List<Widget> _buildMg(BuildContext context, Animation<double> anim) {
    // We want to size to the shortest side
    return [
      Transform.translate(
        offset: Offset(0, config.shortMode ? 70 : -30),
        child: IllustrationPiece(
          fileName: 'people.png',
          //fileName: 'area1.png',
          heightFactor: .1,
          minHeight: 180,
          zoomAmt: -.1,
          enableHero: true,
        ),
      ),
    ];
  }

  List<Widget> _buildFg(BuildContext context, Animation<double> anim) {
    return [
      IllustrationPiece(
        fileName: 'foreground-right.png',
        //fileName: 'watermelon.png',
        alignment: Alignment.bottomCenter,
        initialOffset: Offset(20, 40),
        initialScale: .4,
        heightFactor: .3,
        fractionalOffset: Offset(.7, 0),
        zoomAmt: .1,
        dynamicHzOffset: 250,
      ),
      IllustrationPiece(
        //fileName: 'foreground-left.png',
        fileName: 'summer1.png',
        alignment: Alignment.bottomCenter,
        initialScale: 1,
        initialOffset: Offset(-40, 60),
        heightFactor: .5,
        fractionalOffset: Offset(-.1, 0),
        zoomAmt: .25,
        dynamicHzOffset: -250,
      ),
      IllustrationPiece(
        fileName: 'top-left.png',
        alignment: Alignment.topLeft,
        initialScale: .8,
        initialOffset: Offset(-40, 60),
        heightFactor: .7,
        fractionalOffset: Offset(-.4, -.4),
        zoomAmt: .05,
        dynamicHzOffset: 100,
      ),
      IllustrationPiece(
        fileName: 'top-right.png',
        alignment: Alignment.topRight,
        initialOffset: Offset(20, 40),
        initialScale: .7,
        heightFactor: .7,
        fractionalOffset: Offset(.35, -.4),
        zoomAmt: .05,
        dynamicHzOffset: -100,
      ),
    ];
  }
}
