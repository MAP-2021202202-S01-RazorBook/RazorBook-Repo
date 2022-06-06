import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/style.dart';
import 'package:razorbook_barber/view/widgets/add_services.dart';

class ProfielViewService extends StatefulWidget {
  final bool readOnly;
  const ProfielViewService(
      {Key? key, required this.text, this.readOnly = false})
      : super(key: key);
  final String text;

  @override
  State<ProfielViewService> createState() => _ProfielViewServiceState();
}

class _ProfielViewServiceState extends State<ProfielViewService> {
  List<String> data = ["Western Cut", "K-POP Cut", "Classic Cut"];
  List<String> deletedData = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
                      widget.text,
                      style: kProfileInfoTextBold,
                    ),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.edit_note_sharp)),
                    if (!widget.readOnly)
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddServicesPage()),
                            );

                            // showDialog(
                            //     context: context,
                            //     builder: (ctx) => AlertDialog(
                            //           title: const Text('Add Service'),
                            //           content: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.all(8.0),
                            //                 child: TextFormField(
                            //                   controller: _controller,
                            //                 ),
                            //               ),
                            //               const SizedBox(
                            //                 height: 8,
                            //               ),
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceEvenly,
                            //                 children: [
                            //                   ElevatedButton(
                            //                       style:
                            //                           ElevatedButton.styleFrom(
                            //                               // shape: const StadiumBorder(),
                            //                               primary:
                            //                                   Helper.kFABColor,
                            //                               fixedSize: const Size(
                            //                                   100, 42)),
                            //                       onPressed: () {
                            //                         Navigator.of(context).pop();
                            //                       },
                            //                       child: const Text("CANCLE")),
                            //                   ElevatedButton(
                            //                       style:
                            //                           ElevatedButton.styleFrom(
                            //                               // shape: const StadiumBorder(),
                            //                               primary:
                            //                                   Helper.kFABColor,
                            //                               fixedSize: const Size(
                            //                                   100, 42)),
                            //                       onPressed: () {
                            //                         setState(() {
                            //                           data.add(
                            //                               _controller.text);
                            //                         });
                            //                         Navigator.of(context).pop();
                            //                       },
                            //                       child: const Text("SAVE")),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         ));
                          },
                          icon: const Icon(Icons.edit_note_sharp)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: data.map((e) {
                //     bool isDeleted = deletedData.contains(e);
                //     log(isDeleted ? 'deleted' : 'not deleted');
                //     return !isDeleted
                //         ? Chip(
                //             onDeleted: () {
                //               setState(() {
                //                 if (deletedData.length < data.length - 1) {
                //                   deletedData.add(e);
                //                 }
                //               });
                //             },
                //             label: Text(e),
                //             deleteIcon: const Icon(Icons.cancel)
                //             // backgroundColor: kProfileInfoChipColor,
                //             )
                //         : Container();
                //   }).toList(),
                // ),
                Expanded(
                  child: ListView.builder(
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
                              if (!widget.readOnly)
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        data.removeAt(idx);
                                      });
                                    },
                                    icon: const Icon(Icons.edit_note_sharp)),
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
