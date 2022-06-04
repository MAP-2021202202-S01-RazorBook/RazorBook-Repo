import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import 'package:intl/intl.dart';

class BookServices extends StatefulWidget {
  const BookServices({Key? key}) : super(key: key);

  @override
  State<BookServices> createState() => _BookServicesState();
}

class _BookServicesState extends State<BookServices> {
  final List<Map> services = List.generate(
      20,
      (index) => {
            'id': index,
            'name': 'Item $index',
            'description': 'this is just a test description',
            'price': index * 4,
            'isSelected': false
          });

  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select a Service ",
                        style: TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Helper.kTitleTextColor,
                        ),
                      ),
                      Text(
                        "$totalPrice \$ ",
                        style: const TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Helper.kTitleTextColor,
                        ),
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Click on the card to choose the services that you want, ",
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: "MetropolisExtra",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 141, 141, 141),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: services.length,
                    itemBuilder: ((contwxt, index) {
                      return Card(
                          key: ValueKey(services[index]['name']),
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: services[index]['isSelected'] == true
                              ? Helper.kFABColor
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                if (services[index]['isSelected'] == true) {
                                  services[index]['isSelected'] = false;
                                  totalPrice -= services[index]['price'];
                                } else {
                                  services[index]['isSelected'] = true;
                                  totalPrice += services[index]['price'];
                                }
                              });
                            },
                            title: Text(services[index]['name']),
                            subtitle: Text(services[index]['description']),
                            trailing: Text(services[index]['price'].toString()),
                          ));
                    })),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
