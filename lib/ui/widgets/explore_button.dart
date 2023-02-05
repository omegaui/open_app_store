
import 'package:flutter/material.dart';

class ExploreButton extends StatefulWidget{
  const ExploreButton({super.key});

  @override
  State<ExploreButton> createState() => _ExploreButtonState();
}

class _ExploreButtonState extends State<ExploreButton> {

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
          color: const Color(0xffE32749),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xffE7D3D3), width: 1),
          boxShadow: [
            BoxShadow(
              color: tapped ? Colors.redAccent : Colors.black.withOpacity(0.25),
              blurRadius: tapped ? 20 : 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Or Just Explore",
            style: TextStyle(
              fontFamily: "Itim",
              fontSize: 16,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

