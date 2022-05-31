import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/service_locator/service_locator.dart';
import '../view_model/bookings_view_model.dart';

class ViewBookings extends StatefulWidget {
  const ViewBookings({Key? key}) : super(key: key);

  @override
  State<ViewBookings> createState() => _ViewBookingsState();
}

class _ViewBookingsState extends State<ViewBookings> {


  @override
  Widget build(BuildContext context) {
    locator<BookingsViewModel>().getBookings();
    return ChangeNotifierProvider<BookingsViewModel>(
      create: (_) => locator<BookingsViewModel>(),
      child: Consumer<BookingsViewModel>(
        builder: (context, model, child) => 
        Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 38, 100, 40),
      ),
      body: ListView.builder(
        itemCount: model.bookingsList?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Booking Time: ${model.bookingsList![index].time}"),
            subtitle: Text("Booking Daae: ${model.bookingsList![index].date}"),
            trailing: Text("${model.bookingsList![index].total_price}RM"),
            tileColor: model.bookingsList![index].is_cancelled ? Color.fromARGB(255, 255, 152, 152) : null,
            enabled: true,
            onTap: () {
            if (model.bookingsList![index].is_cancelled) return;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Booking Details"),
                  content: Text("Confirm Cancel Booking?"),
                  actions: <Widget>[

                    FlatButton(
                      child: Text("Dismiss"),
                      textColor: Colors.grey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      textColor: Colors.red,
                      child: Text("Confirm"),
                      onPressed: () {
                        try{model.cancelBooking(model.bookingsList![index].id);
                        Navigator.of(context).pop();}
                        catch(e){print(e.toString());}
                      },
                      
                    )
                  ],
                );
              },
            );
            }
          );
        }
  
      ),
    
      )
      )
    );


  }
}
