import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'widgets/profile_photo_widget.dart';
import 'widgets/editable_textfields.dart';

class CustomerEditProfileView extends StatefulWidget {
  const CustomerEditProfileView({Key? key}) : super(key: key);

  @override
  State<CustomerEditProfileView> createState() =>
      _CustomerEditProfileViewState();
}

class _CustomerEditProfileViewState extends State<CustomerEditProfileView> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          ProfilePhotoWidget(
            isInEditMode: true,
            imagePath:
                "https://images.unsplash.com/photo-1652870026686-cfe9332b2c5d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3774",
            onClicked: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          TextFieldWidget(
            label: 'Name',
            text: "Amit Hasan Sadhin",
            onChanged: (x) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            label: 'Age',
            text: "22 years old",
            onChanged: (x) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            label: 'Gender',
            text: "Male",
            onChanged: (x) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            label: 'Contact Number',
            text: "+601162325010",
            onChanged: (x) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            label: 'Email',
            text: "samithasan7866@gmail.com",
            onChanged: (x) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            label: 'Pasword',
            isApassword: true,
            text: "Amit Hasan Sadhin",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
