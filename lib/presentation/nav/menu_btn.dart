import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:rive/rive.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn(
      {super.key,
      required this.press,
      required this.riveOnInit,
      required this.isSideBarOpen});

  final bool isSideBarOpen;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        onLongPress: () => {},
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 48),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color:
                isSideBarOpen ? Palette.youtubeRed : Colors.black54.withBlue(3),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                offset: const Offset(0, 3),
                blurRadius: 5,
              ),
            ],
          ),
          // child: RiveAnimation.asset(
          //   "assets/RiveAssets/menu_button.riv",
          //   onInit: riveOnInit,
          // ),
          child: Icon(Icons.play_circle_outline,
              color: isSideBarOpen ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
