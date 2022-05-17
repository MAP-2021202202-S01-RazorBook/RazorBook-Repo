import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget(
      {Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);
  final String imagePath;
  final VoidCallback onClicked;

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: NetworkImage(widget.imagePath),
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(
                onTap: widget.onClicked,
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

  Widget editIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
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
