import 'package:app/platform_options/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../pages/landing.dart';
import '../pages/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() => runApp(const AppStartRoutine()));
}


class AppStartRoutine extends StatelessWidget {
  const AppStartRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: UserService.getInstance().getLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? false
                ? const LandingPage()
                : const LoginPage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}