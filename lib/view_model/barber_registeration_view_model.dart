import '../models/barberUserSide/barber_registration_model.dart';


barberInfo(String shopName, String contact, String location,
String locationOnMap, String email, String password){

  BarberDatabaseManager newBarber =  BarberDatabaseManager();

  newBarber.addNewBarber(shopName, contact, location, locationOnMap, email, password);
}