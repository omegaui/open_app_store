
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:open_app_store/io/authentication/authenticator.dart';

import '../screens/login/login_successful_screen.dart';

class GoogleLoginButton extends StatefulWidget{
  const GoogleLoginButton({super.key});

  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          tapped = true;
          Future.delayed(const Duration(milliseconds: 200), () async {
            setState(() => tapped = false);
            if(await Authenticator.authenticate()){
              var page = PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const LoginSuccessfulScreen(),
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => const FadeUpwardsPageTransitionsBuilder().buildTransitions(MaterialPageRoute(builder: (context) => child), context, animation, secondaryAnimation, child));
              Navigator.of(context).pushReplacement(page);
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Login Failed! Try again. ",
                      style: TextStyle(fontFamily: 'Itim', color: Colors.grey.shade800, fontSize: 16),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(20),
                duration: const Duration(milliseconds: 2000),
              ));
            }
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 219,
        height: 54,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff4285F4),
                Color(0xff00A1F1),
                Color(0xff34A853),
                Color(0xff7CBB00),
                Color(0xffFBBC05),
                Color(0xffFFBB00),
                Color(0xffEA4335),
                Color(0xffF65314),
              ],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: tapped ? Colors.redAccent : Colors.black.withOpacity(0.25),
              blurRadius: tapped ? 20 : 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 210,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                "Login with Google",
                style: TextStyle(
                  fontFamily: "Itim",
                  fontSize: 16,
                  color: Color(0xff8A4C4C),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

