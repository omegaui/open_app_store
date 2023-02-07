import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_app_store/io/app_styles.dart';
import 'package:open_app_store/io/authentication/authenticator.dart';
import 'package:open_app_store/ui/screens/login/login_screen.dart';
import 'firebase_options.dart';
import 'io/storage/app_data_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDataManager.initAppData();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Authenticator.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppStyles.backgroundColor,
          body: const LoginScreen(),
        ),
      ),
    );
  }

}