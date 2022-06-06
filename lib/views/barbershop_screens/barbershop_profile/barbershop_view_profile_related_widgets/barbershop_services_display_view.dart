import 'package:flutter/material.dart';
import 'package:razor_book/helpers/styles.dart';
import 'package:razor_book/views/all_services_view.dart';

class BarbershopViewListOfServices extends StatefulWidget {
  final bool readOnly;
  const BarbershopViewListOfServices(
      {Key? key, required this.title, this.readOnly = false})
      : super(key: key);
  final String title;

  @override
  State<BarbershopViewListOfServices> createState() =>
      _BarbershopViewListOfServicesState();
}

class _BarbershopViewListOfServicesState
    extends State<BarbershopViewListOfServices> {
  //those date will be changed with the data coming from viewModel
  List<String> data = ["Western Cut", "K-POP Cut", "Classic Cut"];

  @override
  void initState() {
    super.initState();
  }

  //either you can connect it with View Model here or we can pass it from the constructor
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: kProfileInfoTextBold,
                    ),
                    if (!widget.readOnly)
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const ViewServices()),
                            );
                          },
                          icon: const Icon(Icons.edit_note_sharp)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(

                      //replace data array with fetched one
                      itemCount: data.length,
                      itemBuilder: (ctx, idx) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  data[idx],
                                  style: kProfileInfoText14,
                                ),
                              ),
                              // if (!widget.readOnly)
                              //   IconButton(
                              //       onPressed: () {
                              //         setState(() {
                              //           data.removeAt(idx);
                              //         });
                              //       },
                              //       icon: const Icon(Icons.edit_note_sharp)),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
