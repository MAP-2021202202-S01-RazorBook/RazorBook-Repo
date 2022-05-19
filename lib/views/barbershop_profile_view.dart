import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../views/barbershop_edit_profile_view.dart';
import 'widgets/profile_photo_widget.dart';

class BarberShopProfileView extends StatefulWidget {
  const BarberShopProfileView({Key? key}) : super(key: key);

  @override
  State<BarberShopProfileView> createState() => _BarberShopProfileViewState();
}

class _BarberShopProfileViewState extends State<BarberShopProfileView> {
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
        child: Column(
          // physics: const BouncingScrollPhysics(),
          children: [
            ProfilePhotoWidget(
              imagePath:
                  "https://images.unsplash.com/photo-1648737119247-e93f56878edf?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072",
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const BarbershopEditProfilePage()),
                );
              },
              isInEditMode: true,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Blazer Lazer",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Johor Bauhr - Malaysia",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Contact ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "+601636394433",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Center(
              child: MaterialButton(
                child: const Text("View Location On Man"),
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textColor: Colors.white,
                shape: const StadiumBorder(),
                color: const Color.fromARGB(255, 41, 172, 123),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Available Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 55,
                    color: Colors.black,
                    height: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  availablsTimes(),
                  const Text(
                    "Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 55,
                    color: Colors.black,
                    height: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
                      child: offeredServices()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget offeredServices() => Column(
        children: <Widget>[
          for (int i = 0; i < 10; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "Afro Haircut",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "\u20B9 300",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
        ],
      );

  Widget availablsTimes() => Container(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext ctxt, int index) {
            return Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const SizedBox(
                    height: 80,
                    width: 70,
                  ),
                ),
                Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 41, 172, 123),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 80,
                  width: 60,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '09:00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
}
