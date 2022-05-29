import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
import 'package:razor_book/views/home_view.dart';
import 'package:razor_book/views/login_view.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(milliseconds: 400),
            () {
              Provider.of<LocalStorageServiceProvider>(context, listen: false)
                ..readUID()
                ..readCusProfile();
            },
          ),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("snapshot data : ${snapshot.data}");
              String? uid = Provider.of<LocalStorageServiceProvider>(context,
                      listen: false)
                  .uid;
              print("Provider.of<AuthViewModelProvider>(context).uid :$uid");
              if (uid != null) {
                return const HomeView();
              } else {
                return const LoginView();
              }
            } else {
              return const Scaffold(
                body: Center(child: CupertinoActivityIndicator()),
              );
            }
          }),
    );
  }
}
