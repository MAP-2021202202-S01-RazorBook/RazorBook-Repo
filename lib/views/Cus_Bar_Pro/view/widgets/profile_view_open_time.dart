import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/style.dart';
import 'package:time_range_picker/time_range_picker.dart';

class ProfileViewOpenTime extends StatefulWidget {
  final bool readOnly;
  const ProfileViewOpenTime({
    Key? key,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<ProfileViewOpenTime> createState() => _ProfileViewOpenTimeState();
}

class _ProfileViewOpenTimeState extends State<ProfileViewOpenTime> {
  List<Map<String, dynamic>> data = [
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
    {"start": "9:00 AM", "end": "5:00 PM"},
  ];
  List<String> days = [
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
    "SUN",
    "MON",
  ];
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
                      "Opening Time",
                      style: kProfileInfoTextBold,
                    ),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.edit_note_sharp)),
                    if (!widget.readOnly)
                      IconButton(
                          onPressed: () async {
                            TimeRange? result =
                                await showTimeRangePicker(context: context);
                            if (result != null) {
                              if (data.length <= 6) {
                                setState(() {
                                  // data.add(
                                  //     "${result.startTime.format(context)} - ${result.endTime.format(context)} ");
                                });
                              }
                            }
                            // showDialog(
                            //     context: context,
                            //     builder: (ctx) => AlertDialog(
                            //           title: const Text('Add Open Time'),
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
                          icon: const Icon(Icons.add)),
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
                // Expanded(
                //   child: ListView.builder(
                //       itemCount: data.length,
                //       itemBuilder: (ctx, idx) {
                //         return Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 4.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(vertical: 8.0),
                //                 child: Text(
                //                   "${days[idx]}-${data[idx]}",
                //                   style: kProfileInfoText14,
                //                 ),
                //               ),
                //               if (!widget.readOnly)
                //                 IconButton(
                //                     onPressed: () {
                //                       setState(() {
                //                         data.removeAt(idx);
                //                       });
                //                     },
                //                     icon: const Icon(Icons.cancel)),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                Expanded(
                  // height: 200,
                  // width: MediaQuery.of(context).size.width,
                  child: DefaultTabController(
                      length: 7,
                      child: Column(
                        children: [
                          Expanded(
                            child: TabBar(
                              isScrollable: true,
                              tabs: days
                                  .map((e) => Chip(
                                        backgroundColor: Colors.indigo,
                                        padding: const EdgeInsets.all(0),
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                              fontFamily: 'Metropolis',
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, top: 21),
                              child: TabBarView(
                                  children: data.map((e) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await showTimePicker(
                                            context: context,
                                            initialTime: const TimeOfDay(
                                                hour: 8, minute: 0));
                                      },
                                      child: Chip(
                                        backgroundColor: Colors.green,
                                        label: Text(
                                          e['start'],
                                          style: const TextStyle(
                                            fontFamily: 'Metropolis',
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await showTimePicker(
                                            context: context,
                                            initialTime: const TimeOfDay(
                                                hour: 20, minute: 0));
                                      },
                                      child: Chip(
                                        backgroundColor: Colors.amber,
                                        label: Text(
                                          e['end'],
                                          style: const TextStyle(
                                            fontFamily: 'Metropolis',
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList()),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
