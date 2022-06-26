import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/helpers/colors.dart';
import 'package:razor_book/models/booking.dart';
import 'package:razor_book/view_model/cumster_noti_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.read<CustomerNotificationProvider>();
    model.getNotification();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Helper.kTitleTextColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontFamily: "MetropolisExtra",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Helper.kTitleTextColor,
            ),
          ),
        ),
        body: StreamBuilder(
            stream: model.notiStream,
            builder: (ctx, AsyncSnapshot<List<Booking>> snapshot) {
              log("NotificationView: ${snapshot.connectionState}");
              if (snapshot.connectionState != ConnectionState.active) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<Booking> data = snapshot.data ?? [];
              if (data.isNotEmpty) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          key: Key(data[idx].id.toString()),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.notifications_active),
                            ),
                            title: Text(
                              "${data[idx].barberName} ",
                              style: const TextStyle(
                                fontFamily: "MetropolisExtra",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Helper.kTitleTextColor,
                              ),
                            ),
                            subtitle: const Text("cancelled your order"),
                            trailing: Text(timeago.format(
                                DateTime.parse(data[idx].updatedAt).toLocal())),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text("No Notification"),
                );
              }
            }));
  }
}
