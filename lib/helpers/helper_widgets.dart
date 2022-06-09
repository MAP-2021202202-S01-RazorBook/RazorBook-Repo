import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextField inputField(String text, IconData icon, bool isPassword,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: !isPassword,
    autocorrect: !isPassword,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container confirmButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

// message snackbar
SnackBar messageSnackBar(String message, Color bgColor) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: bgColor,
  );
}

TextField pickTime(String text, TextEditingController timeInputController,
    BuildContext context) {
  return TextField(
    controller: timeInputController, //editing controller of this TextField
    decoration: InputDecoration(
      icon: Icon(Icons.timer), //icon of text field
      labelText: text, //label text of field
    ),
    readOnly: true, //set it true, so that user will not able to edit text
    onTap: () async {
      TimeOfDay? pickedTime = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      );

      if (pickedTime != null) {
        print(pickedTime.format(context)); //output 10:51 PM
        DateTime parsedTime =
            DateFormat.jm().parse(pickedTime.format(context).toString());
        //converting to DateTime so that we can further format on different pattern.
        print(parsedTime); //output 1970-01-01 22:53:00.000
        String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
        print(formattedTime); //output 14:59:00
        //DateFormat() is from intl package, you can format the time on any pattern you need.

        // setState(() {
        timeInputController.text = formattedTime; //set the value of text field.
        // });
      } else {
        print("Time is not selected");
      }
    },
  );
}

SnackBar mySnackBar(String message, {bool error = false}) {
  return SnackBar(
      content: Text(message),
      backgroundColor: error ? Colors.red : Colors.green);
}

// this textfield is only used in the barbershopProfile

TextField pickTimeInBarberShopProfile(
    {required String hintText,
    required TextEditingController timeInputController,
    required BuildContext context}) {
  return TextField(
    controller: timeInputController, //editing controller of this TextField

    textAlign: TextAlign.start,
    cursorColor: Colors.black,
    style: const TextStyle(
      fontFamily: 'Metropolis',
      fontSize: 14,
      color: Color(0xff4a4b4d),
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.only(left: 30),
      hintStyle: const TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      fillColor: Helper.kTextFieldColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),

    readOnly: true, //set it true, so that user will not able to edit text
    onTap: () async {
      TimeOfDay? pickedTime = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      );

      if (pickedTime != null) {
        DateTime parsedTime =
            DateFormat.jm().parse(pickedTime.format(context).toString());
        //converting to DateTime so that we can further format on different pattern.
        String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

        //DateFormat() is from intl package, you can format the time on any pattern you need.

        // setState(() {
        timeInputController.text = formattedTime; //set the value of text field.
        // });
      }
    },
  );
}
