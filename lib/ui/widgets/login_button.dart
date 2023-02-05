
import 'package:flutter/material.dart';

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
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() => tapped = false);
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
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

