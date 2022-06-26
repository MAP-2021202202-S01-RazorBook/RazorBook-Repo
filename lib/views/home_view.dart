import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/barber_noti_view_model.dart';
import 'package:razor_book/view_model/cumster_noti_view_model.dart';
import 'package:razor_book/view_model/shop_view_model.dart';
// import 'package:razor_book/models/service.dart';
import 'package:razor_book/views/barbershop_screens/barbershop_main_page_nav.dart';
import 'package:razor_book/views/customer_screens/customer_main_page_nav.dart';
import 'package:razor_book/views/login_view.dart';
// import 'package:razor_book/services/barbershop_profile/barbershop_profile_service.dart';
// import 'package:razor_book/services/customer/customer_service.dart';
import '../app/service_locator/service_locator.dart';
// import '../services/barber_services/barber_services_service.dart';
import '../services/local_storage_service/local_storage_service.dart';
import '../view_model/barber_profile_view_model.dart';
import '../view_model/bookings_view_model.dart';
import '../view_model/customer_profile_view_model.dart';
// import '../views/login_view.dart';
// import '../views/all_bookings_view.dart'; //tbd
import '../router.dart' as router;
// import 'all_services_view.dart';
import '../view_model/login_view_model.dart';
import '../view_model/services_view_model.dart';

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

        ChangeNotifierProvider(
            create: (_) => locator<BarberProfileViewModel>()),

        ChangeNotifierProvider(
          create: (_) => locator<BookingsViewModel>(),
        ),
        ChangeNotifierProvider(create: (_) => locator<ServicesViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<LoginViewModel>()),
        ChangeNotifierProvider(
            create: (_) => locator<LocalStorageServiceProvider>()),
        ChangeNotifierProvider(create: (_) => locator<ShopViewModelProvider>()),
        Provider<CustomerNotificationProvider>(
          create: (_) => locator<CustomerNotificationProvider>(),
          dispose: (ctx, p) => p.dispose(),
        ),
        Provider<BarberNotificationProvider>(
          create: (_) => locator<BarberNotificationProvider>(),
          dispose: (ctx, p) => p.dispose(),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var data = HomeViewModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(data.title),
//         ),
//         body: Center(
//             child: Column(children: [
//           ElevatedButton(
//               child: const Text("Login"),
//               onPressed: () async {
//                 Navigator.pushNamed(context, LoginViewRoute);
//               }),
//           ElevatedButton(
//               child: const Text("Bookings"),
//               onPressed: () async {
//                 Navigator.pushNamed(context, BarberBookingsRoute);
//               }),
//           ElevatedButton(
//               child: const Text("Barber Services"),
//               onPressed: () async {
//                 Navigator.pushNamed(context, BarberServicesRoute);
//               }),
//           ElevatedButton(
//             child: const Text("Book Now"),
//             onPressed: () async {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: ((context) => const BookNow(
//                             barbershop_id: "just random id",
//                           ))));
//             },
//           ),
//           ElevatedButton(
//             child: const Text("barbershop Profile"),
//             onPressed: () async {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: ((context) => const BarberMainPageNav())));
//             },
//           ),
//           ElevatedButton(
//               child: const Text("testing services"),
//               onPressed: () async {
//                 // await locator<CustomerService>().getCustomerDetailsForCustomer(
//                 //     'eRiujAfrWASWbosQGToSO1wcmNz1');
//                 // print("customer service get customer for customer:");
//                 // print(locator<CustomerService>()
//                 //     .customerDetailsForCustomer?["bookings"][0]);

//                 // await locator<BarbershopService>().getBarbershopsList();
//                 // print("barbershop service get barbershop for barber:");
//                 // print(locator<BarbershopService>().barbershopsList);

//                 // await locator<BarberServicesService>()
//                 //     .getServices(userID: 'eRiujAfrWASWbosQGToSO1wcmNz1');
//                 // print("barber service get services:");
//                 // print(locator<BarberServicesService>().servicesList?[1].id);

//                 // await locator<BarberServicesService>().editService(
//                 //     serviceID: "SWWt4m8kEbkteJou65zj",
//                 //     updatedService: Service(
//                 //       sh_id: "eRiujAfrWASWbosQGToSO1wcmNz1",
//                 //       price: 20,
//                 //       name: "New haircute",
//                 //       description: "The best haircut in town",
//                 //     ));
//                 // await locator<BarberServicesService>()
//                 //     .deleteService(serviceID: "SWWt4m8kEbkteJou65zj");

//                 // await locator<BarberServicesService>().addService(
//                 //     service: Service(
//                 //   sh_id: "eRiujAfrWASWbosQGToSO1wcmNz1",
//                 //   price: 10,
//                 //   name: "Beard fade",
//                 //   description: "Get a low cost beard fade",
//                 // ));

//                 // await locator<BookingService>().getCustomerBookings(
//                 //     userID: "eRiujAfrWASWbosQGToSO1wcmNz1");
//                 // print("booking service get customer bookings:");
//                 // print(locator<BookingService>().barberBookingsList?.length);

//                 await locator<BookingService>()
//                     .generateSlots(bID: "yKUgyp8lpYXOmaDxon1r1CKeVCL2");
//                 print("booking service generate slots:");
//                 print(locator<BookingService>().slotsList);
//               }),
//         ])));
//   }
// }
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: locator<AuthenticationService>().authState,
        builder: ((context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Scaffold(
              body: Center(child: CupertinoActivityIndicator()),
            );
          }
          String? uid = locator<AuthenticationService>().currentUser?.u_id;
          User? userProfile = locator<AuthenticationService>().currentUser;
          final user = snapshot.data;

          log("-----------home----------------");
          print(uid);
          print(userProfile?.toJson().toString());
          log("-------------home------------------");
          return user == null
              ? const LoginView()
              : userProfile == null
                  ? const LoginView()
                  : userProfile.user_type == "barber"
                      ? const BarberMainPageNav()
                      : const CustomerMainPageNav();
        }));
  }
}
