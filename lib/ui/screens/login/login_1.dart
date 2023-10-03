import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/ui/screens/home/wonders_home_screen.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // final _authentication = FirebaseAuth.instance; //이메일과 패스워드를 사용한 사용자 등록, 로그인 메서드 사용 가능

  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  String passwordCheck = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate(); //모든 텍스트 폼필드의 validator 작동 가능
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

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
                    onTap: () => appRouter.go(ScreenPaths.home),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: NanenAppTheme.nearlyBlack,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   child: Container(
          //     padding: const EdgeInsets.only(top: 90),
          //     height: 300,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(tCalmImage),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         RichText(
          //           text: TextSpan(
          //             text: 'Welcome',
          //             style: const TextStyle(
          //               letterSpacing: 1.0,
          //               fontSize: 25,
          //               color: Colors.white,
          //             ),
          //             children: [
          //               TextSpan(
          //                 text: isSignupScreen ? ' to 나는_' : ' back',
          //                 style: const TextStyle(
          //                   letterSpacing: 1.0,
          //                   fontSize: 25,
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5.0,
          //         ),
          //         Text(
          //           isSignupScreen ? 'Signup to continue' : 'Signin to continue',
          //           style: const TextStyle(
          //             letterSpacing: 1.0,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //배경
          Positioned(
            top: MediaQuery.of(context).size.height - 530,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(20),
              // height: isSignupScreen ? 280 : 250,
              height: 350,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),

              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen ? tActiveColor : tTextColor1,
                                    fontFamily: NanenAppTheme.fontName
                                    //isSignUpScreen일 경우 activeColor, 아닐경우 textColor1 - 삼항조건 연산자
                                    ),
                              ),
                              if (!isSignupScreen) //inline if
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: NanenAppTheme.nearlyDarkBlue,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? tActiveColor : tTextColor1,
                                    fontFamily: NanenAppTheme.fontName),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: NanenAppTheme.nearlyDarkBlue,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen)
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: const ValueKey(1),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userName = value!;
                                },
                                onChanged: (value) {
                                  userName = value;
                                },
                                decoration: CustomeInputDeco(Icons.account_circle, 'User name'),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                key: const ValueKey(2),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userEmail = value!;
                                },
                                onChanged: (value) {
                                  userEmail = value;
                                },
                                decoration: CustomeInputDeco(
                                  Icons.email,
                                  'Email',
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                obscureText: true,
                                key: const ValueKey(3),
                                validator: (value) {
                                  passwordCheck = value.toString();
                                  //firebase인증 사용할 시 패스워드 길이 반드시 6자 이상이여야 함!(그렇지 않으면 오류발생)
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                decoration: CustomeInputDeco(Icons.lock, 'Password'),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                obscureText: true,
                                key: const ValueKey(6),
                                validator: (value) {
                                  //firebase인증 사용할 시 패스워드 길이 반드시 6자 이상이여야 함!(그렇지 않으면 오류발생)
                                  if (value!.isEmpty || value != passwordCheck) {
                                    return 'Password isn\'t correct.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                decoration: CustomeInputDeco(Icons.lock, 'Password check'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (!isSignupScreen)
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: const ValueKey(4),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userEmail = value!;
                                },
                                onChanged: (value) {
                                  userEmail = value;
                                },
                                decoration: CustomeInputDeco(Icons.email, 'Email'),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                obscureText: true,
                                key: const ValueKey(5),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                decoration: CustomeInputDeco(Icons.password, 'Password'),
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
          //텍스트 폼 필드
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.easeIn,
          //   top: isSignupScreen ? 430 : 390,
          //   right: 0,
          //   left: 0,
          //   child: Center(
          //     child: Container(
          //       padding: const EdgeInsets.all(15),
          //       height: 90,
          //       width: 90,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //   ),
          // ),

          //전송버튼
          Positioned(
              top: MediaQuery.of(context).size.height - 230,
              left: 0,
              right: 0,

              // top: isSignupScreen ? MediaQuery.of(context).size.height - 125 : MediaQuery.of(context).size.height - 165,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: EditBtn(btnTitle: '+Google', path: HomeScreen()),
              )),
          // Positioned(
          //   top: MediaQuery.of(context).size.height - 170,
          //   // top: isSignupScreen ? MediaQuery.of(context).size.height - 125 : MediaQuery.of(context).size.height - 165,
          //   right: 0,
          //   left: 0,
          //   child: Column(
          //     children: [
          //       Text(
          //         isSignupScreen ? 'or Signup with' : 'or Signin with',
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       EditBtn(btnTitle: '+Google', path: HomeScreen())
          //     ],
          //   ),
          // ),
          //구글 로그인 버튼
        ],
      ),
    );
  }
}

InputDecoration CustomeInputDeco(IconData customeIcon, String Title) {
  return InputDecoration(
    prefixIcon: Icon(
      customeIcon,
      color: tIconColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: NanenAppTheme.grey.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: NanenAppTheme.nearlyDarkBlue,
      ),
    ),
    hintText: Title,
    hintStyle: TextStyle(fontSize: 14, color: tTextColor1, fontFamily: NanenAppTheme.fontName),
    contentPadding: EdgeInsets.all(10),
  );
}
