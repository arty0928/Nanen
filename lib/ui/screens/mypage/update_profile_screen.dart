import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/nanen_text_string.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/router.dart';
import 'package:wonders/styles/colors.dart';
import 'package:wonders/styles/sizes.dart';
import 'package:wonders/ui/screens/login/login_1.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
import 'package:wonders/utils/appbar/costume_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: NanenAppTheme.nearlyWhite,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: NanenAppTheme.nearlyBlack,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Container(
                color: NanenAppTheme.nearlyWhite,
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: const Image(image: AssetImage(tProfileImage)),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100), color: tPrimaryColor.withOpacity(0.8)),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditBtn(
                      btnTitle: 'Edit Profile AI',
                      newwidth: 400.0,
                      backgroundStartColor: const Color(0xFFFE95B6),
                      backgroundEndColor: const Color(0xFFFF5287),
                      path: null,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: const ValueKey(2),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          decoration: CustomeInputDeco(Icons.email, 'Email'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        TextFormField(
                          obscureText: true,
                          key: const ValueKey(3),
                          validator: (value) {
                            //firebase인증 사용할 시 패스워드 길이 반드시 6자 이상이여야 함!(그렇지 않으면 오류발생)
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          decoration: CustomeInputDeco(Icons.lock, 'Password'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        EditBtn(
                          btnTitle: 'Save Profile',
                          newwidth: 400.0,
                          backgroundStartColor: Color(0xFF6F72CA),
                          backgroundEndColor: Color(0xFF1E1466),
                          path: null,
                        ),
                        // const SaveEditProfileBtn(),
                        // EditBtn(
                        //   btnTitle: 'Save Profile',
                        //   // const Color(0xFF6F72CA),
                        //   // endColor: const Color(0xFF1E1466),
                        //   backgroundStartColor: Color(0xFF6F72CA),
                        //   backgroundEndColor: Color(0xFF1E1466),
                        // ),
                      ],
                    ))
                  ],
                ),
              ))
          //배경
        ],
      ),
    );
    // return Scaffold(
    //   appBar: const CostumedAppBar(
    //     bartitle: 'Edit Profile',
    //   ),
    //   body: SingleChildScrollView(
    //     child: Container(
    //       color: NanenAppTheme.background,
    //       padding: const EdgeInsets.all(tDefaultSize),
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Stack(
    //                 children: [
    //                   SizedBox(
    //                     width: 100,
    //                     height: 100,
    //                     child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(200),
    //                         child: const Image(image: AssetImage(tProfileImage))),
    //                   ),
    //                   Positioned(
    //                     bottom: 0,
    //                     right: 0,
    //                     child: Container(
    //                       width: 35,
    //                       height: 35,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(100), color: tPrimaryColor.withOpacity(0.8)),
    //                       child: const Icon(
    //                         LineAwesomeIcons.camera,
    //                         size: 20,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 18,
    //           ),
    //           // const EditAIProfileAIBtn(),

    //           EditBtn(
    //             btnTitle: 'Edit Profile AI',
    //             newwidth: 400.0,
    //             backgroundStartColor: const Color(0xFFFE95B6),
    //             backgroundEndColor: const Color(0xFFFF5287),
    //             path: null,
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Form(
    //             child: Column(
    //               children: [
    //                 TextFormField(
    //                   decoration: const InputDecoration(
    //                       label: Text(tEmail), iconColor: tSeconddaryColor, prefixIcon: Icon(Icons.email_outlined)),
    //                 ),
    //                 TextFormField(
    //                   decoration: const InputDecoration(
    //                       label: Text(tID),
    //                       iconColor: tSeconddaryColor,
    //                       prefixIcon: Icon(Icons.person_outline_rounded)),
    //                 ),
    //                 TextFormField(
    //                   decoration: const InputDecoration(
    //                       prefixIconColor: Color(0xFF1E1466),
    //                       suffixIconColor: Color(0xFF1E1466),
    //                       fillColor: Color(0xFF1E1466),
    //                       label: Text(
    //                         tPassword,
    //                         style: TextStyle(color: Color(0xFF1E1466)),
    //                       ),
    //                       iconColor: tSeconddaryColor,
    //                       prefixIcon: Icon(Icons.password_outlined)),
    //                 ),
    //                 const SizedBox(
    //                   height: tFormHeight,
    //                 ),

    //                 Container(
    //                   color: Color(0xFF1E1466),
    //                 ),

    //                 /// - Form Submit Button
    //                 EditBtn(
    //                   btnTitle: 'Save Profile',
    //                   newwidth: 400.0,
    //                   backgroundStartColor: Color(0xFF6F72CA),
    //                   backgroundEndColor: Color(0xFF1E1466),
    //                   path: null,
    //                 ),
    //                 // const SaveEditProfileBtn(),
    //                 // EditBtn(
    //                 //   btnTitle: 'Save Profile',
    //                 //   // const Color(0xFF6F72CA),
    //                 //   // endColor: const Color(0xFF1E1466),
    //                 //   backgroundStartColor: Color(0xFF6F72CA),
    //                 //   backgroundEndColor: Color(0xFF1E1466),
    //                 // ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
