import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'widgets/profile_photo_widget.dart';
import 'customer_edit_profile_view.dart';
class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfilePhotoWidget(
              imagePath:
                  "https://images.unsplash.com/photo-1652870026686-cfe9332b2c5d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3774",
              onClicked: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CustomerEditProfileView()),
                  );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            detailsTextFields("Name", "Amit Hasan Sadhin"),
            detailsTextFields("Age", "22 years old"),
            detailsTextFields("Gender", "Male"),
            detailsTextFields("Contact Number", "+601162325010"),
            detailsTextFields("Email", "samithasan7866@gamil.com"),
        
          ],
        ));
  }

  Widget detailsTextFields(
    String feildLabel,
    String fieldContent,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feildLabel,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              fieldContent,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
}
