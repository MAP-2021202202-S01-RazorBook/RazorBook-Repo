import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final bool isApassword;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.isApassword = false,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.label,
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          // ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: widget.isApassword,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 41, 172, 123),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 41, 172, 123),
                ),
              ),
              border: const OutlineInputBorder(),
              labelText: widget.label,
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 41, 172, 123)),
            ),
            controller: controller,
            maxLines: widget.maxLines,
          ),
        ],
      );
}
