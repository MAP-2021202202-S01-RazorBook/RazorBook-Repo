import 'package:flutter/material.dart';

class ViewBookings extends StatefulWidget {
  const ViewBookings({Key? key}) : super(key: key);

  @override
  State<ViewBookings> createState() => _ViewBookingsState();
}

class _ViewBookingsState extends State<ViewBookings> {

  var bookings = [
    {
      ""
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 38, 100, 40),
      ),
      body: ListView(
        children: <Widget>[
          // start lits
          InkWell(
            child: Container(
              height: 100, width:100,
              child: Card(
                child: Row(children: <Widget>[
                       Expanded(child: Container(height: 90, child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                         Text("That Barber", textAlign: TextAlign.center),
                         Row(children: <Widget>[
                            Text(
                              "Price:",
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " very good lah",
                              textAlign: TextAlign.left,
                            )
                          ]),
                          Row(children: <Widget>[
                            Text(
                              "Date:",
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " very good lah",
                              textAlign: TextAlign.left,
                            )
                          ]),
                          Row(children: <Widget>[
                            Text(
                              "Time:",
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " very good lah",
                              textAlign: TextAlign.left,
                            )
                          ]),
                          Row(children: <Widget>[
                            Text(
                              "Confirmed:",
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " I guess?",
                              textAlign: TextAlign.right,
                            )
                          ]),
                          
                       ],)),),
                ],),
              ),
            ),
          onTap: () {
              AlertDialog alert = AlertDialog(
                title: Text('Cancel Booking?'),
                content: const Text(
                    'By clicking "Confirm" you are canceling the selected booking.'),
                actions: [
                  FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('DISMISS'),
                  ),
                  FlatButton(
                    textColor: Color.fromARGB(255, 234, 10, 10),
                    onPressed: () {},
                    child: const Text('CONFIRM'),
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
          });}
          )
          
            // end list
        ]
      ),
    );
  }
}
