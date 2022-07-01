import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/view_model/barber_profile_view_model.dart';

class LocationGoogle extends StatefulWidget {
  @override
  _LocationGoogleState createState() => _LocationGoogleState();
}

class _LocationGoogleState extends State<LocationGoogle> {
  String googleApikey = "AIzaSyAldHS5x0MGL_4LqVZmqDQ3lPbnGCSosik";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  String location = "Location Name:";
//  LatLng startLocation = LatLng(0.0, 0.0);
  double lng = 0.0;
  double lat = 0.0;
  @override
  Widget build(BuildContext context) {
    BarberProfileViewModel model = context.watch<BarberProfileViewModel>();
    LatLng startLocation = LatLng(
        double.parse(model.barbershopProfileForBarber?["location"]["lat"]),
        double.parse(model.barbershopProfileForBarber?["location"]["lng"]));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Change shop location"),
          backgroundColor: Helper.kFABColor,
        ),
        body: Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona; //when map is dragging
            },
            onCameraIdle: () async {
              lng = cameraPosition!.target.longitude;
              lat = cameraPosition!.target.latitude;
              //when map drag stops
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();
              });
            },
          ),
          Center(
            //picker image on google map
            child: Image.asset(
              "assets/images/picker.png",
              width: 30,
            ),
          ),
          Positioned(
              //widget to display location name
              bottom: 100,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width - 40,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/picker.png",
                          width: 25,
                        ),
                        title: Text(
                          "$location lng = ${lng == 0 ? "" : lng} \n lat= ${lat == 0 ? "" : lat}",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            model.updateLocationDetails(
                                lat.toString(), lng.toString());
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Helper.kFABColor,
                            size: 30,
                          ),
                        ),
                        dense: true,
                      )),
                ),
              ))
        ]));
  }
}
