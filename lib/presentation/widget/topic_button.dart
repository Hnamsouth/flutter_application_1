import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';

class TopicButton extends StatelessWidget {
  final void Function() onPressed;
  final int index;
  final int appBarIndex;

  const TopicButton(
      {super.key,
      required this.onPressed,
      required this.index,
      required this.appBarIndex});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: index == appBarIndex
            ? Colors.white
            : const Color.fromARGB(169, 55, 55, 55),
        foregroundColor: index == appBarIndex
            ? const Color.fromARGB(169, 55, 55, 55)
            : Colors.white,
      ),
      child: Text(topicsData[index].name),
    );
  }
}
