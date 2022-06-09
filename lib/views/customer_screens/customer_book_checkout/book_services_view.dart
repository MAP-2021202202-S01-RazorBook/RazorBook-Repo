// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';

import '../../../helpers/colors.dart';

class BookServices extends StatelessWidget {
  const BookServices({Key? key, required this.barbershop_id}) : super(key: key);

  final String barbershop_id;
//   @override
//   State<BookServices> createState() => _BookServicesState();
// }

// class _BookServicesState extends State<BookServices> {

//   //this generated list is used as an example just change it with the once fetched
//   //from the ViewModel and edit the places where it was used.
//   //be aware that in the viewModel we must add the "isSelected" as it's cruial
//   //to select mutliple items
//   // "isSelect" is only stored here in the app it has no datafield in the firebase.

//   final List<Map> services = List.generate(
//       20,
//       (index) => {
//             'id': index,
//             'name': 'Item $index',
//             'description': 'this is just a test description',
//             'price': index * 4,
//             'isSelected': false
//           });

//   double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingsViewModel>(
        builder: (context, BookingsViewModel viewModel, _) {
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
                          "${viewModel.totalPrice} \$ ",
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
                SizedBox(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: viewModel.services.length,
                      itemBuilder: ((contwxt, index) {
                        return Card(
                          key: ValueKey(viewModel.services[index]['name']),
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: viewModel.services[index]['isSelected'] == true
                              ? Helper.kFABColor
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              if (viewModel.services[index]['isSelected'] ==
                                  true) {
                                viewModel.services[index]['isSelected'] = false;
                                viewModel.totalPrice -=
                                    viewModel.services[index]['price'];
                              } else {
                                viewModel.services[index]['isSelected'] = true;
                                viewModel.totalPrice +=
                                    viewModel.services[index]['price'];
                              }
                            },
                            title: Text(viewModel.services[index]['name']),
                            subtitle:
                                Text(viewModel.services[index]['description']),
                            trailing: Text(
                                viewModel.services[index]['price'].toString()),
                          ),
                        );
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
    });
  }
}
