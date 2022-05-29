import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/views/root_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // ChangeNotifierProvider(
        //   create: (context) => AuthViewModelProvider()
        //     ..readUID()
        //     ..readCusProfile(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => ShopViewModelProvider(),
        // ),
        // ChangeNotifierProvider(create: (context) => ProfileViewModelProvider()),
      ],
      child: const MaterialApp(
        home: RootView(),
      ),
    );
  }
}
