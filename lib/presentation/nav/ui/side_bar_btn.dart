import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  final Offset offset;
  final void Function() onPressed;
  final Function(DraggableDetails)? onDragEnd;
  final Function(DragUpdateDetails)? onDragUpdate;
  const SideBarButton(
      {super.key,
      required this.offset,
      required this.onPressed,
      this.onDragEnd,
      required this.onDragUpdate});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: LongPressDraggable<int>(
          childWhenDragging: Container(),
          feedback: Container(
            width: 41,
            height: 41,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.black87,
            ),
          ),
          onDragEnd: onDragEnd,
          // onDragUpdate: onDragUpdate,
          child: Container(
              width: 41,
              height: 41,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 158, 158, 158)
                        .withOpacity(0.5),
                    offset: const Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: onPressed,
                backgroundColor: Colors.grey.shade900.withOpacity(0.8),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              )),
        ));
  }
}
