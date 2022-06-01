import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/service_locator/service_locator.dart';
import '../view_model/services_view_model.dart';

class ViewServices extends StatefulWidget {
  const ViewServices({Key? key}) : super(key: key);

  @override
  State<ViewServices> createState() => _ViewServicesState();
}

class _ViewServicesState extends State<ViewServices> {


  @override
  Widget build(BuildContext context) {
    locator<ServicesViewModel>().getServices();
    return ChangeNotifierProvider<ServicesViewModel>(
      create: (_) => locator<ServicesViewModel>(),
      child: Consumer<ServicesViewModel>(
        builder: (context, model, child) => 
        Scaffold(
      appBar: AppBar(
        title: Text("Barber Services"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 38, 100, 40),
      ),
      body: ListView.builder(
        itemCount: model.servicesList?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Name: ${model.servicesList![index].name}"),
            subtitle: Text("Description: ${model.servicesList![index].description}"),
            trailing: Text("${model.servicesList![index].price} RM"),
            //tileColor: model.servicesList![index].is_cancelled ? Color.fromARGB(255, 255, 152, 152) : null,
            enabled: true,
            // onTap: () {
            // if (model.bookingsList![index].is_cancelled) return;
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: Text("Booking Details"),
            //       content: Text("Confirm Cancel Booking?"),
            //       actions: <Widget>[

            //         FlatButton(
            //           child: Text("Dismiss"),
            //           textColor: Colors.grey,
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //         FlatButton(
            //           textColor: Colors.red,
            //           child: Text("Confirm"),
            //           onPressed: () {
            //             try{model.cancelBooking(model.bookingsList![index].id);
            //             Navigator.of(context).pop();}
            //             catch(e){print(e.toString());}
            //           },
                      
            //         )
            //       ],
            //     );
            //   },
            // );
            // }
          );
        }
  
      ),
    
      )
      )
    );


  }
}
