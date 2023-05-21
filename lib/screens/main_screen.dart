import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eos_chatting/config/palette.dart';
import 'package:eos_chatting/screens/chat_screen.dart';


class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final _authentication = FirebaseAuth.instance;

  // login 과 signup의 state 저장
  bool isSignupScreen = true;

  String userName = "";
  String userEmail = "";
  String userPassword = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Welcome ',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                children: [
                                    TextSpan(
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
                          height: 5.0,
                        ),
                          Text(
                            isSignupScreen ? 'Signup to continue' : 'Signin to continue',
                            style: TextStyle(letterSpacing: 1.0, color: Colors.white,),
                          ),
                      ],
                    ),
                  ),
                )
            ),

            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                top: 150,
                curve: Curves.easeIn,
                height: isSignupScreen ? 300.0 : 250.0,

                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 280.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        )
                      ]
                  ),
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
                                        color: !isSignupScreen ? Palette.activeColor : Palette.textColor1
                                    ),
                                  ),
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
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignupScreen ? Palette.activeColor : Palette.textColor1
                                      ),
                                    ),
                                    if(isSignupScreen)
                                      Container(
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
                                            Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor),
                                                    hintText: 'User name',
                                                    hintStyle: TextStyle(color: Palette.iconColor),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    )
                                                ),
                                                controller: _nameController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.email, color: Palette.iconColor),
                                                    hintText: 'email',
                                                    hintStyle: TextStyle(color: Palette.iconColor),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    )
                                                ),
                                                controller: _emailController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.lock, color: Palette.iconColor),
                                                    hintText: 'password',
                                                    hintStyle: TextStyle(color: Palette.iconColor),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Palette.textColor1),
                                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                    )
                                                ),
                                                controller: _passwordController,
                                                obscureText: true,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),
                                          ],
                                      )
                                  else if(!isSignupScreen)
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.email, color: Palette.iconColor),
                                                hintText: 'email',
                                                hintStyle: TextStyle(color: Palette.iconColor),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Palette.textColor1),
                                                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                                )
                                            ),
                                            controller: _emailController,
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock, color: Palette.iconColor),
                                              hintText: 'password',
                                              hintStyle: TextStyle(color: Palette.iconColor),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Palette.textColor1),
                                                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Palette.textColor1),
                                                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                              )
                                            ),
                                            controller: _passwordController,
                                            obscureText: true,
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    ),
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
              top: isSignupScreen ? 410 : 340,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  child: GestureDetector(
                    onTap: () async {
                      // todo : 여기에!
                      if (isSignupScreen) {
                        userName = _nameController.text;
                        userEmail = _emailController.text;
                        userPassword = _passwordController.text;
                        try {
                          final newUser = await _authentication.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
                          // user id 저장
                          await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({'userName': userName, 'email': userEmail,});

                          if (newUser.user != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ChatScreen();
                            }));
                          }
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please check your email and password'),
                            backgroundColor: Colors.blue,
                          ));
                        }
                      }
                      if (!isSignupScreen) {
                        userEmail = _emailController.text;
                        userPassword = _passwordController.text;
                        try {
                          final newUser = await _authentication.signInWithEmailAndPassword(email: userEmail, password: userPassword);
                          if (newUser.user != null) {}
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
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
                        child: Icon(Icons.arrow_forward, color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height - 125 ,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                  SizedBox(height: 10),
                  TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Palette.googleColor,
                      ),
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