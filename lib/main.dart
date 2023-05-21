import 'package:eos_chatting/config/palette.dart';
import 'package:eos_chatting/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eos_chatting/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/color_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //runApp(const MyApp());
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        // primary 색을 우리가 만든 색으로!
        primarySwatch: ColorService.createMaterialColor(Palette.eosColor),
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //TODO : 인증받은 토큰을 가졌다면
            if (snapshot.hasData) {
              // 인증받은 토큰을 가졌다면
              return ChatScreen();
            }
            return LoginSignUpScreen();

      })
    );  // home: ChatScreen());
  }
}
