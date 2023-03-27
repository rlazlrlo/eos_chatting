import 'package:flutter/material.dart';
import 'package:eos_chatting/config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  // TODO : isSignupScreen 변수 선언
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : background color로 palette의 backgroundColor 설정
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
              // TODO : top, left, right 모두0으로 설정
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  // TODO : height 300으로 설정
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // TODO : background.png 넣기
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    //TODO : padding top 90, left 20
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      // TODO : 왼쪽 정렬
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                              // TODO : letter spacing 1.0, font size 25, color white
                                text: 'Welcome ',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                children: [
                                    TextSpan(
                                      // TODO : letter spacing 1.0, font size 25, color white, bold
                                        text: isSignupScreen ? 'to EOS chat' : 'back',
                                        style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                ]
                            )
                        ),
                        SizedBox(
                          // TODO : height 5.0으로 글 사이 간격 주기
                          height: 5.0,
                        ),
                          Text(
                            // TODO : spacing 1.0, color white
                            isSignupScreen ? 'Signup to continue' : 'Signin to continue',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
            ),

            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                // TODO : top 150
                top: 150,
                child: AnimatedContainer(
                  // TODO : height 280.0, padding 모두 20, width 핸드폰 가로 길이 – 40
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  height: isSignupScreen ? 300.0 : 250.0, //280 -> 300
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  // TODO : margin 가로로 양쪽 20
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    // TODO : color white, border radius 15
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          // TODO : color black, 투명도 0.3, blur radius 15, spread radius 5
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        )
                      ]
                  ),
                  child: Column(
                      children: [
                        Row(
                          // TODO : mainAxisAlignment.spaceAround
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                } );
                                },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    // TODO : font size 16, bold
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        // TODO : isSignupScreen이 false면 palette의 activeColor, true면 palette의 textColor1
                                        color: !isSignupScreen ? Palette.activeColor : Palette.textColor1
                                    ),
                                  ),
                                  // TODO : isSigunupScreen이 false일 때만 밑줄이 생기도록
                                  if(!isSignupScreen)
                                    Container(
                                      // TODO : margin top만 3, height 2, width 55, color green
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.green,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = true;
                                  } );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'SIGNUP',
                                      // TODO : font size 16, bold
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          // TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
                                          color: isSignupScreen ? Palette.activeColor : Palette.textColor1
                                      ),
                                    ),
                                    if(isSignupScreen)
                                      Container(
                                        // TODO : margin top만 3, height 2, width 55, color green
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.green,
                                      )
                                  ],
                                )
                            )
                          ],
                        ),

                        AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            margin: EdgeInsets.only(top: 20.0),
                            child: Form(
                              child: Column(
                                  children: [
                                    if(isSignupScreen)
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8, bottom: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                // TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                                hintText: 'User name',
                                                prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  // TODO : borderside 색은 palette의 textColor1
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  // TODO : border radius는 모두 35
                                                  borderRadius: BorderRadius.all(Radius.circular(35)
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  // TODO : borderside 색은 palette의 textColor1
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  // TODO : border radius는 모두 35
                                                  borderRadius: BorderRadius.all(Radius.circular(35)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'email',
                                                prefixIcon: Icon(Icons.mail, color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'password',
                                                prefixIcon: Icon(Icons.lock, color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if(!isSignupScreen)
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8, bottom: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'email',
                                                prefixIcon: Icon(Icons.mail, color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'password',
                                                prefixIcon: Icon(Icons.lock, color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ]
                              ),
                            )
                        )
                      ]
                  ),
                )
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 400 : 340, //490 -> 400
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                    // TODO : padding은 모두 15, height 90, width 90
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      // TODO : 하얀색, borderRadius는 50
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.lightGreen, Colors.green],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1)
                              )
                            ]
                        ),
                        child: Icon(
                          // TODO : 화살표 icon, 색은 하얀색
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                    )
                )
              )
            ),

            Positioned(
              // TODO : top은 핸드폰 세로길이에서 – 125, right 0, left 0
              top: MediaQuery.of(context).size.height - 125 ,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  // TODO : LOGIN 누르면 ‘or Signin with’
                  // SIGNUP 누르면 ‘or Signin with’
                  // SizedBox height 10으로 사이 공간 주기
                  Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                  SizedBox(height: 10),
                  TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        // TODO : 배경색은 palette의 googleColor
                        backgroundColor: Palette.googleColor,
                      ),
                      // TODO : 더하기 아이콘 넣고 ‘Google’ 쓰기
                      icon: Icon(Icons.add),
                      label: Text('Google'),
                  )
                ],
              ),
            ),

          ],
        )
    );
  }
}