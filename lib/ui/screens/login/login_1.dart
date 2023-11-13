import 'package:wonders/common_libs.dart';
import 'package:wonders/controller/login.dart';
import 'package:wonders/controller/registerUser.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/model/model.dart';
import 'package:wonders/ui/screens/home/wonders_home_screen.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // final _authentication = FirebaseAuth.instance; //이메일과 패스워드를 사용한 사용자 등록, 로그인 메서드 사용 가능

  bool isSignupScreen = true;

  // 서버 클라이언트 연결
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController userNickNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late UserModel user;

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
    userInfoProvider.getImageCount();
  }

  @override
  void dispose() {
    // dispose에서 listener를 제거해야 합니다.
    userInfoProvider.removeListener(() {});

    super.dispose();
  }

// 이메일 형식이 유효한지 확인하는 함수
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
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
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 70),
              child: Container(
                padding: const EdgeInsets.only(top: 90),
                height: 130,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/marketing/app-icon-512.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          //배경
          userInfoProvider.isLoggedIn
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            userInfoProvider.logout();
                            appRouter.go(ScreenPaths.home);
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
                              '로그 아웃',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height - 580,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        padding: const EdgeInsets.all(20),
                        // height: isSignupScreen ? 280 : 250,
                        height: 380,
                        width: MediaQuery.of(context).size.width - 40,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),

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
                                  // key: _formKey,
                                  child: Column(
                                    children: [
                                      //Nickname
                                      TextFormField(
                                        key: const ValueKey(1),
                                        controller: userNickNameController,
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 4) {
                                            return 'Please enter at least 4 characters';
                                          }
                                          return null;
                                        },
                                        decoration: CustomeInputDeco(Icons.account_circle_rounded, 'Nickname'),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      // // User name
                                      TextFormField(
                                        key: const ValueKey(2),
                                        controller: usernameController,
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 4) {
                                            return 'Please enter at least 4 characters';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userName = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userName = value;
                                        // },
                                        decoration: CustomeInputDeco(Icons.account_circle, 'Username'),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      //User email
                                      TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        controller: emailController,
                                        key: const ValueKey(3),
                                        validator: (value) {
                                          if (value!.isEmpty || !value.contains('@')) {
                                            return 'Please enter a valid email address.';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userEmail = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userEmail = value;
                                        // },
                                        decoration: CustomeInputDeco(
                                          Icons.email,
                                          'Email',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      //password
                                      TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        key: const ValueKey(4),
                                        validator: (value) {
                                          //firebase인증 사용할 시 패스워드 길이 반드시 6자 이상이여야 함!(그렇지 않으면 오류발생)
                                          if (value!.isEmpty || value.length < 6) {
                                            return 'Password must be at least 7 characters long.';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userPassword = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userPassword = value;
                                        // },
                                        decoration: CustomeInputDeco(Icons.lock, 'Password'),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      //passwordcheck
                                      TextFormField(
                                        controller: passwordCheckController,
                                        obscureText: true,
                                        key: const ValueKey(5),
                                        validator: (value) {
                                          //firebase인증 사용할 시 패스워드 길이 반드시 6자 이상이여야 함!(그렇지 않으면 오류발생)
                                          if (value!.isEmpty) {
                                            return 'Password isn\'t correct.';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userPassword = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userPassword = value;
                                        // },
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
                                  // key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        key: const ValueKey(3),
                                        validator: (value) {
                                          if (value!.isEmpty || !value.contains('@')) {
                                            return 'Please enter a valid email address.';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userEmail = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userEmail = value;
                                        // },
                                        decoration: CustomeInputDeco(Icons.email, 'Email'),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        key: const ValueKey(4),
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 6) {
                                            return 'Password must be at least 7 characters long.';
                                          }
                                          return null;
                                        },
                                        // onSaved: (value) {
                                        //   userPassword = value!;
                                        // },
                                        // onChanged: (value) {
                                        //   userPassword = value;
                                        // },
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

                    //전송버튼
                    Positioned(
                      top: MediaQuery.of(context).size.height - 230,
                      left: 0,
                      right: 0,

                      // top: isSignupScreen ? MediaQuery.of(context).size.height - 125 : MediaQuery.of(context).size.height - 165,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF738AE6),
                          ),
                          child: Text('Submit'),
                          onPressed: () async {
                            if (isSignupScreen) {
                              String userName = usernameController.text;
                              String userNickName = userNickNameController.text;
                              String userEmail = emailController.text;
                              String userPassword = passwordController.text;
                              String userPasswordCheck = passwordCheckController.text;

                              registerUser(userName, userPassword, userEmail, userNickName, userPasswordCheck, context);
                            } else {
                              String userEmail = emailController.text;
                              String userPassword = passwordController.text;

                              loginUser(userEmail, userPassword, context);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
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
