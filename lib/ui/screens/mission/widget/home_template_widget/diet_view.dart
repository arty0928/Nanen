import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/styles/styles.dart';
import 'package:wonders/ui/screens/login/login_1.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class MediterranesnDietView extends StatefulWidget {
  MediterranesnDietView({
    required this.animationController,
    required this.animation,
    super.key,
  });

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  State<MediterranesnDietView> createState() => _MediterranesnDietViewState();
}

class _MediterranesnDietViewState extends State<MediterranesnDietView> {
  late UserInfoProvider userInfoProvider;

  @override
  void initState() {
    super.initState();
    print("홈화면 바뀜");

    userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);

    // userInfo의 변화를 감지하여 화면 업데이트
    // userInfo의 변화를 감지하여 화면 업데이트
    userInfoProvider.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    userInfoProvider.getUserInfo();
  }

  @override
  void dispose() {
    // dispose에서 listener를 제거해야 합니다.
    userInfoProvider.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 30 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: NanenAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: NanenAppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    //다시 호출
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: userInfoProvider.isLoggedIn
                          ? Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 48,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF87A0E5).withOpacity(0.5),
                                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 4, bottom: 2),
                                                    child: Text(
                                                      'User Info',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: NanenAppTheme.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: NanenAppTheme.grey.withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Image.asset('assets/logo/logo.png'),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 4, bottom: 3),
                                                        child: Text(
                                                          userInfoProvider.userName.toString(),
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                            fontFamily: NanenAppTheme.fontName,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            color: NanenAppTheme.darkerText,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 48,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF56E98).withOpacity(0.5),
                                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 4, bottom: 2),
                                                    child: Text(
                                                      'Welcome',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: NanenAppTheme.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: NanenAppTheme.grey.withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 4, bottom: 3),
                                                        child: Text(
                                                          '오늘 하루를 기록해보세요!',
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                            fontFamily: NanenAppTheme.fontName,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            color: NanenAppTheme.darkerText,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UpdateProfileScreen(),
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/profile/profile_default.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) => const LoginSignupScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        '로그인을 진행해 주세요!',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: NanenAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Active',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: NanenAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: NanenAppTheme.darkText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    height: 4,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF87A0E5).withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: (70 / 1.2) * widget.animation.value,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: <Color>[
                                              const Color(0xFF87A0E5),
                                              const Color(0xFF87A0E5).withOpacity(0.5),
                                            ]),
                                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    '12g left',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: NanenAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: NanenAppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'Calm',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: NanenAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: NanenAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        height: 4,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF56E98).withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: (70 / 2) * widget.animationController.value,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: <Color>[
                                                  const Color(0xFFF56E98).withOpacity(0.1),
                                                  const Color(0xFFF56E98),
                                                ]),
                                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '30g left',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: NanenAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: NanenAppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'Creative',
                                      style: TextStyle(
                                        fontFamily: NanenAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: NanenAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        height: 4,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1B440).withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: (70 / 2.5) * widget.animationController.value,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: <Color>[
                                                  const Color(0xFFF1B440).withOpacity(0.1),
                                                  const Color(0xFFF1B440),
                                                ]),
                                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '10g left',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: NanenAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: NanenAppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'People',
                                      style: TextStyle(
                                        fontFamily: NanenAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: NanenAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        height: 4,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1B440).withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: (70 / 2.5) * widget.animationController.value,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: <Color>[
                                                  const Color(0xFFF1B440).withOpacity(0.1),
                                                  const Color(0xFFF1B440),
                                                ]),
                                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '10g left',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: NanenAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: NanenAppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
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

class CurvePainter extends CustomPainter {
  CurvePainter({required this.colors, this.angle = 140});

  final double angle;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint shdowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final Offset shdowPaintCenter = Offset(size.width / 2, size.height / 2);
    final double shdowPaintRadius = math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius), degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)), false, shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius), degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)), false, shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius), degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)), false, shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius), degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)), false, shdowPaint);

    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final SweepGradient gradient = SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colors,
    );
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)), false, paint);

    const SweepGradient gradient1 = SweepGradient(
      tileMode: TileMode.repeated,
      colors: <Color>[Colors.white, Colors.white],
    );

    final Paint cPaint = Paint();
    cPaint.shader = gradient1.createShader(rect);
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.save();

    final double centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(const Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    final double radian = (math.pi / 180) * degree;
    return radian;
  }
}
