
import 'package:flutter/material.dart';
import 'package:open_app_store/io/app_resources.dart';
import 'package:open_app_store/io/app_styles.dart';

class LoginSuccessfulScreen extends StatelessWidget{
  const LoginSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login Successful",
                    style: TextStyle(
                      fontFamily: "Sen",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Image(
                    image: AppResources.successfulLoginArtWork,
                    width: 256,
                    height: 256,
                  ),
                  const SizedBox(height: 70),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppStyles.backgroundColor,
                      foregroundColor: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        "🚀 Explore 🚀",
                        style: TextStyle(
                          fontFamily: "Sen",
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AppResources.appIcon,
                    width: 88,
                  ),
                  const Text(
                    "Open App Store",
                    style: TextStyle(
                      fontFamily: "Lobster",
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}



