import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'widgets/profile_photo_widget.dart';
import 'widgets/editable_textfields.dart';

class BarbershopEditProfilePage extends StatefulWidget {
  const BarbershopEditProfilePage({Key? key}) : super(key: key);

  @override
  State<BarbershopEditProfilePage> createState() =>
      _BarbershopEditProfilePageState();
}

class _BarbershopEditProfilePageState extends State<BarbershopEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              ProfilePhotoWidget(
                isInEditMode: true,
                imagePath:
                    "https://images.unsplash.com/photo-1648737119247-e93f56878edf?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072",
                onClicked: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                label: 'Shop Name',
                text: "Blazer Lazer",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'Contact',
                text: "+60116360332",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'Location',
                text: "Johor Bahur - Malaysia",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'Location on Map',
                text: "42423,53534",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'Email',
                text: "Hamzehbouj@gmail.cm",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                isApassword: true,
                label: 'Password',
                text: "42423,53534",
                onChanged: (x) {},
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: const Color.fromARGB(255, 41, 172, 123),
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
