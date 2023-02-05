
import 'package:flutter/material.dart';
import 'package:open_app_store/io/app_resources.dart';
import 'package:open_app_store/ui/widgets/explore_button.dart';
import 'package:open_app_store/ui/widgets/login_button.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AppResources.appIcon,
                  width: 245,
                  height: 235.2,
                ),
                const Text(
                  "Open App Store",
                  style: TextStyle(
                    fontFamily: "Lobster",
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Once you are logged in, you can submit  your apps, packages or any file",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Itim",
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                const GoogleLoginButton(),
                const SizedBox(height: 35),
                const ExploreButton(),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "“Dive into the world of open source software and packages”",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Itim",
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

