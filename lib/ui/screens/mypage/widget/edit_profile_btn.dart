import 'package:flutter/material.dart';
import 'package:wonders/styles/colors.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/custom_page_route.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart';

class EditBtn extends StatelessWidget {
  final backgroundStartColor;
  final double? newwidth;
  final backgroundEndColor;
  final btnTitle;
  final path;

  const EditBtn(
      {super.key,
      required this.btnTitle,
      this.backgroundStartColor = const Color(0xFF738AE6),
      this.backgroundEndColor = const Color(0xFF5C5EDD),
      this.newwidth = 100,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CustomPageRoute(AxisDirection.left,
            // child: UpdateProfileScreen()
            child: path));
      },
      child: SizedBox(
        // width: 100,
        width: newwidth,
        // width: double.infinity,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25, left: 5, right: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      //  color: mealsListData.endColor.withOpacity(0.6),
                      // color: Color(0xFF5C5EDD),
                      color: backgroundEndColor,
                      offset: Offset(1.1, 2.0),
                      blurRadius: 2.0,
                    )
                  ],
                  gradient: LinearGradient(
                    colors: <Color>[
                      // Color(0xFF738AE6),
                      // Color(0xFF5C5EDD),
                      backgroundStartColor,
                      backgroundEndColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              // 'Edit Profile',
                              btnTitle,
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
                          ],
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
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10),
    //   child:
    //   GestureDetector(
    //     onTap: () {
    //       _navigateEditPage(context);
    //     },
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(vertical: 5),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(3),
    //               border: Border.all(color: tPrimaryColor),
    //             ),
    //             child: const Text(
    //               'Edit Profile',
    //               style: TextStyle(
    //                 color: tDarkColor,
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

_navigateEditPage(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    transitionDuration: const Duration(microseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: const UpdateProfileScreen());
    },
  ));
}

class SaveEditProfileBtn extends StatelessWidget {
  const SaveEditProfileBtn({super.key});

  void saveEditProfile() {
    print("save eidt profile");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      // width: double.infinity,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25, left: 5, right: 5, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    //  color: mealsListData.endColor.withOpacity(0.6),
                    color: Color(0xFF5C5EDD),
                    offset: Offset(1.1, 2.0),
                    blurRadius: 8.0,
                  )
                ],
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF738AE6),
                    Color(0xFF5C5EDD),
                    // backgroundStartColor,
                    // backgroundEndColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Save Profile',
                            // btnTitle,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10),
    //   child: GestureDetector(
    //     onTap: () {
    //       saveEditProfile();
    //     },
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(vertical: 5),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(3),
    //                 border: Border.all(color: tAccentColor),
    //                 color: tAccentColor),
    //             child: const Text(
    //               'SAVE',
    //               style: TextStyle(
    //                 color: tDarkColor,
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class EditAIProfileAIBtn extends StatelessWidget {
  const EditAIProfileAIBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          _navigateEditPage(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: tPrimaryColor),
                    color: tPrimaryColor),
                child: const Text(
                  'Make AI Profile',
                  style: TextStyle(
                    color: tDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
