import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:razor_book/models/service.dart';
import 'package:razor_book/router-constants.dart';
// import 'package:razor_book/services/barbershop_profile/barbershop_profile_service.dart';
import 'package:razor_book/services/booking/booking_service.dart';
// import 'package:razor_book/services/customer/customer_service.dart';
import '../app/service_locator/service_locator.dart';
// import '../services/barber_services/barber_services_service.dart';
import '../view_model/bookings_view_model.dart';
import '../view_model/customer_profile_view_model.dart';
import '../view_model/home_view_model.dart';
// import '../views/login_view.dart';
// import '../views/all_bookings_view.dart'; //tbd
import '../router.dart' as router;
// import 'all_services_view.dart';
import 'barbershop_screens/barbershop_main_page_nav.dart';
import 'customer_screens/customer_book_checkout/book_now_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // auth service
        Provider<AuthenticationService>(
          create: (_) => locator<AuthenticationService>(),
        ),

        ChangeNotifierProvider(
            create: (_) => locator<CustomerProfileViewModel>()),

        ChangeNotifierProvider(create: (_) => locator<BookingsViewModel>()),
      ],
      child: const MaterialApp(
        home: Home(),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.title),
        ),
        body: Center(
            child: Column(children: [
          ElevatedButton(
              child: const Text("Login"),
              onPressed: () async {
                Navigator.pushNamed(context, LoginViewRoute);
              }),
          ElevatedButton(
              child: const Text("Bookings"),
              onPressed: () async {
                Navigator.pushNamed(context, BarberBookingsRoute);
              }),
          ElevatedButton(
              child: const Text("Barber Services"),
              onPressed: () async {
                Navigator.pushNamed(context, BarberServicesRoute);
              }),
          ElevatedButton(
            child: const Text("Book Now"),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const BookNow(
                            barbershop_id: "just random id",
                          ))));
            },
          ),
          ElevatedButton(
            child: const Text("barbershop Profile"),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const BarberMainPageNav())));
            },
          ),
          ElevatedButton(
              child: const Text("testing services"),
              onPressed: () async {
                // await locator<CustomerService>().getCustomerDetailsForCustomer(
                //     'eRiujAfrWASWbosQGToSO1wcmNz1');
                // print("customer service get customer for customer:");
                // print(locator<CustomerService>()
                //     .customerDetailsForCustomer?["bookings"][0]);

                // await locator<BarbershopService>().getBarbershopsList();
                // print("barbershop service get barbershop for barber:");
                // print(locator<BarbershopService>().barbershopsList);

                // await locator<BarberServicesService>()
                //     .getServices(userID: 'eRiujAfrWASWbosQGToSO1wcmNz1');
                // print("barber service get services:");
                // print(locator<BarberServicesService>().servicesList?[1].id);

                // await locator<BarberServicesService>().editService(
                //     serviceID: "SWWt4m8kEbkteJou65zj",
                //     updatedService: Service(
                //       sh_id: "eRiujAfrWASWbosQGToSO1wcmNz1",
                //       price: 20,
                //       name: "New haircute",
                //       description: "The best haircut in town",
                //     ));
                // await locator<BarberServicesService>()
                //     .deleteService(serviceID: "SWWt4m8kEbkteJou65zj");

                // await locator<BarberServicesService>().addService(
                //     service: Service(
                //   sh_id: "eRiujAfrWASWbosQGToSO1wcmNz1",
                //   price: 10,
                //   name: "Beard fade",
                //   description: "Get a low cost beard fade",
                // ));

                // await locator<BookingService>().getCustomerBookings(
                //     userID: "eRiujAfrWASWbosQGToSO1wcmNz1");
                // print("booking service get customer bookings:");
                // print(locator<BookingService>().barberBookingsList?.length);

                await locator<BookingService>()
                    .generateSlots(bID: "yKUgyp8lpYXOmaDxon1r1CKeVCL2");
                print("booking service generate slots:");
                print(locator<BookingService>().slotsList);
              }),
        ])));
  }
}
