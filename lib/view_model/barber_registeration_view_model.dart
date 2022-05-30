import '../models/barberUserSide/barber_registration_model.dart';

Future barberInfo(String shopName, String contact, String location,
    String locationOnMap, String email, String password) async {
  BarberDatabaseManager newBarber = BarberDatabaseManager();

  return await newBarber.addNewBarber(
      shopName, contact, location, locationOnMap, email, password);
}
