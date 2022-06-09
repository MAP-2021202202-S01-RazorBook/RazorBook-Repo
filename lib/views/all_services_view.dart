import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/models/service.dart';

import '../helpers/colors.dart';
import '../view_model/services_view_model.dart';
import 'common_widgets/pages_appbar.dart';

class ViewServices extends StatefulWidget {
  const ViewServices({Key? key}) : super(key: key);

  @override
  State<ViewServices> createState() => _ViewServicesState();
}

class _ViewServicesState extends State<ViewServices> {
  final TextEditingController _serviceNameTextFieldController =
      TextEditingController();
  final TextEditingController _serviceDesciptionTextFieldController =
      TextEditingController();
  final TextEditingController _servicePriceTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ServicesViewModel>();

    return FutureBuilder(
      future: model.getServices(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Scaffold(
            appBar: appBar(
                bartitle: const Text(
                  "Barbershop Services",
                  style: TextStyle(
                    fontFamily: "MetropolisExtra",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Helper.kTitleTextColor,
                  ),
                ),
                onPressedFunctionForRightAction: () {},
                appBarRightIcon: const Icon(null)),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _showDialogEditOrAdd(
                    context: context,
                    title: 'Add A new Service',
                    passedMethod: () async {
                      //pass your methods here
                      // for the mean while I'm adding a new element in the array
                      //and this is only will be showed in the view
                      //also it's missing the id
                      await model.addService(
                          service: Service(
                              sh_id: model.currentUser?.u_id ?? "",
                              name: _serviceNameTextFieldController.text,
                              description:
                                  _serviceDesciptionTextFieldController.text,
                              price: double.parse(
                                  _servicePriceTextFieldController.text)));
                    });
                //you might add the service methods here
              },
              backgroundColor: Helper.kFABColor,
              child: const Icon(Icons.add),
            ),
            body: ListView.builder(
                itemCount: model.servicesList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: ListTile(
                      leading: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Helper.kFABColor,
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "${model.servicesList![index].price} \nRM",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      isThreeLine: true,
                      title: Text("Name: ${model.servicesList![index].name}"),
                      subtitle: Text(
                          "Description: ${model.servicesList![index].description}"),
                      enabled: true,
                      trailing: PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        },

                        //will check from the value of PopUpMneu and based on it it
                        //it execute the work
                        onSelected: (String value) {
                          if (value == 'edit') {
                            //to view the same current data that we are holding in our controller in the textfieds
                            setState(() {
                              _serviceNameTextFieldController.text =
                                  model.servicesList![index].name;

                              _serviceDesciptionTextFieldController.text =
                                  model.servicesList![index].description!;

                              _servicePriceTextFieldController.text =
                                  model.servicesList![index].price.toString();
                            });

                            _showDialogEditOrAdd(
                              context: context,
                              title: 'Add A new Service',
                              passedMethod: () {
                                //pass your methods here
                                // for the mean while I'm editing the current element in the array
                                //and this is only will be showed in the view
                                //also it's missing the id
                                model.servicesList![index].name =
                                    _serviceNameTextFieldController.text;

                                model.servicesList![index].description =
                                    _serviceNameTextFieldController.text;

                                model.servicesList![index].price = double.parse(
                                    _servicePriceTextFieldController.text);
                                //add the services here
                              },
                            );
                          } else if (value == 'delete') {
                            //this is to delete it from the fetched list and re-render
                            //the screen.
                            //you have to use the service function here either outside setState Or in it
                            setState(() {
                              model.servicesList!.removeAt(index);
                            });
                            //add the service here
                          } else {
                            //do nothing}
                          }
                        },
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }

  Future<void> _showDialogEditOrAdd(
      {required BuildContext context,
      required String title,
      required VoidCallback passedMethod}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextFormField(
              controller: _serviceNameTextFieldController,
              decoration: const InputDecoration(
                labelText: 'Service Name',
                border: OutlineInputBorder(),
              ),
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _serviceDesciptionTextFieldController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Service Desription',
                border: OutlineInputBorder(),
              ),
              validator: (description) {
                if (description!.isEmpty) {
                  return 'Enter a Description';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _servicePriceTextFieldController,
              decoration: const InputDecoration(
                labelText: 'Service Price',
                border: OutlineInputBorder(),
              ),
              validator: (price) {
                if (price!.isEmpty ||
                    price.runtimeType != double ||
                    price.runtimeType != int) {
                  return 'Enter a Valid price';
                } else {
                  return null;
                }
              },
            ),
          ]),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _serviceNameTextFieldController.clear();
                _serviceDesciptionTextFieldController.clear();
                _servicePriceTextFieldController.clear();
              },
              child: const Text("Dismiss"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text("Confirm"),
              onPressed: () {
                setState(() {
                  passedMethod();
                });

                //clean the controlles from the current values
                _serviceNameTextFieldController.clear();
                _serviceDesciptionTextFieldController.clear();
                _servicePriceTextFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// onTap: () {
// if (model.bookingsList![index].is_cancelled) return;
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       title: Text("Booking Details"),
//       content: Text("Confirm Cancel Booking?"),
//       actions: <Widget>[

//         FlatButton(
//           child: Text("Dismiss"),
//           textColor: Colors.grey,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         FlatButton(
//           textColor: Colors.red,
//           child: Text("Confirm"),
//           onPressed: () {
//             try{model.cancelBooking(model.bookingsList![index].id);
//             Navigator.of(context).pop();}
//             catch(e){print(e.toString());}
//           },

//         )
//       ],
//     );
//   },
// );
// }
