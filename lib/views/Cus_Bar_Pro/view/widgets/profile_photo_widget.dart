import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget(
      {Key? key,
      required this.imagePath,
      required this.onClicked,
      this.isInEditMode = false})
      : super(key: key);

  final String imagePath;
  final VoidCallback onClicked;
  final bool isInEditMode;

  @override
  Widget build(BuildContext context) {
    final color = Color.fromARGB(255, 41, 172, 123);
    return Center(
      child: Stack(children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image:  NetworkImage(imagePath),
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(
                onTap: onClicked,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: editIcon(color),
        )
      ]),
    );
  }

  Widget editIcon(
    Color color,
  ) =>
      buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isInEditMode ? Icons.edit : Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
