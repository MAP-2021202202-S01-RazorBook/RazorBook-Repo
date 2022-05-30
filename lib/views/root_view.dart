import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/app/service_locator/service_locator.dart';
import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
import 'package:razor_book/views/home_view.dart';
import 'package:razor_book/views/login_view.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  String? uid;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("UID : $uid");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(milliseconds: 2000),
            () => localStorageServiceProvider..readUID()..readCusProfile(),
          ),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Scaffold(
                body: Center(child: CupertinoActivityIndicator()),
              );
            }
            uid =
                Provider.of<LocalStorageServiceProvider>(context, listen: false)
                    .uid;

            log("--------ROOT VIEW--------");
            log("${snapshot.connectionState}");
            log('uid: $uid');
            log('----------ROOT VIEW-------');
            return uid == null ? const LoginView() : const HomeView();
          }),
    );
  }
}
