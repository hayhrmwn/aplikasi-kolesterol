import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kolestrol/Information/info/TDS.dart';
import 'package:kolestrol/Register/Register.dart';
import 'package:kolestrol/SplashScreen.dart';
import 'package:kolestrol/Login/Login.dart';
import 'package:kolestrol/Login/Login1.dart';
import 'package:kolestrol/Login/Login2.dart';
import 'package:kolestrol/Bluetooth/Bluetooth.dart';
import 'package:kolestrol/HomePage/HomePage2.dart';
import 'package:kolestrol/Information/info.dart';
import 'package:kolestrol/Information/info/CTI.dart';
import 'package:kolestrol/Tools/Tools.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kolestrol/firebase_options.dart';
import 'package:kolestrol/profile/profile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
      home: SplashScreen(
        onSplashScreenFinished: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HalamanDaftarLogin()),
          );
        },
      ),
      routes: {
        '/login': (context) => const HalamanDaftarLogin(),
        //'/login1': (context) => const Login(),
        '/ForgotPass': (context) => const ForgotPassword(),
        // '/scanQR': (context) => const ScanQr(),
        '/bluetooth': (context) => Bluetooth(),
        '/homepage': (context) => const HomePage(),
        '/informasi': (context) => const InfoPage(),
      },
    );
  }
}
