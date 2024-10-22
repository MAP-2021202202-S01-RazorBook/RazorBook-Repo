import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razor_book/models/user.dart';
import 'package:razor_book/view_model/bookings_view_model.dart';

import '../../../helpers/colors.dart';

class BookingsSlotsList extends StatelessWidget {
  const BookingsSlotsList({Key? key, required this.barbershop})
      : super(key: key);
  final User barbershop;

//   //should be replaced with the once fetched from the database.
//   List<String> days = [
//     "Sunday",
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thrusday",
//     "Friday",
//     "Saturday"
//   ];

// //this function will check from coming 7 days starting from current date and check whether it's
// // a working day or not, if yes it returns the date of those days
// //this function might be moved to the ViewModel where from there we can store a the list
// //result is YYYY-MM-DD of the working day

//   List<String> getDateOfWorkingDays() {
//     List<String> datesOfWorkingDays = [];
//     for (int i = 0; i < days.length + 1; i++) {
//       var date = DateTime.now().add(Duration(days: i));
//       if (days.contains(DateFormat('EEEE').format(date))) {
//         datesOfWorkingDays.add(DateFormat('dd/MM/yyyy').format(date));
//       }
//     }

//     return datesOfWorkingDays;
//   }

//   //this function will return list of slots,
//   //later on the view model there should be comparsion between this generated slots
//   //and the slots that have been booked to the applcation delete them and not include them.
//   // as well as not including the slots from the open time to current time -but this one is difficult to implement-
//   //the logic is already  built -it's the commented part- but hard to use it only for one object
//   //since it's a function called in a loop

//   List<String> generateBookingSlots(
//       {required String openTime,
//       required String closeTime,
//       required double slotLength}) {
//     List<String> bookingSlots = [];

//     //get list of working days
//     List<String> listOfWorkingDate = getDateOfWorkingDays();

//     //convert time "10:43:13" to TimeDay Object
//     var format = DateFormat("HH:mm");
//     var shopOpenTime = format.parse(openTime);
//     var shopCloseTime = format.parse(closeTime);

//     //to find the difference between the two time
//     Duration durationBetweenOpenAndClose =
//         shopCloseTime.difference(shopOpenTime).abs();
//     var hours = durationBetweenOpenAndClose.inHours;
//     var minutes = durationBetweenOpenAndClose.inMinutes % 60;

//     //this object temporary which used to add time to it
//     var tempTime = shopOpenTime;

//     //if current date is provided check whether today date is working day
//     //and then calculate current time of the current date and open time
//     // delete the slots that passed.
//     //todayDate is used to check if the current day is a working day
//     // var todaydate = DateFormat('dd/MM/yyyy').format(DateTime.now());
//     // //there must be these two varaible otherwise the will be logical error
//     // var timeNowString = DateFormat('HH:mm').format(DateTime.now());
//     // var currentTime = format.parse(timeNowString);

//     // if (listOfWorkingDate.contains(todaydate) &&
//     //     currentTime.isAfter(shopOpenTime)) {
//     //   Duration durationBetweenCurrentTimeAndClose =
//     //       shopCloseTime.difference(currentTime).abs();
//     //   hours = durationBetweenCurrentTimeAndClose.inHours;
//     //   minutes = durationBetweenCurrentTimeAndClose.inMinutes % 60;
//     //   tempTime = currentTime;
//     // }

//     //to add the slot to the bookings slots array
//     //note for the logic : if the slot length is 1.0, then if we have any situation like
//     // 19:43, it will not calculate the minutes
//     if (slotLength == 0.5) {
//       for (int i = 0; i < hours * 2; i++) {
//         tempTime = tempTime.add(const Duration(minutes: 30));

//         bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
//       }
//       if (minutes >= 30) {
//         tempTime = tempTime.add(const Duration(minutes: 30));
//         bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
//       }
//     } else {
//       for (int i = 0; i < hours; i++) {
//         tempTime = tempTime.add(const Duration(hours: 1));

//         bookingSlots.add(DateFormat("HH:mm a").format(tempTime).toString());
//       }
//     }
//     return bookingSlots;
//   }

  @override
  Widget build(BuildContext context) {
    //this variable should be deleted later once it's connected to viewModel
    //will return dateOf the weeks
    final bookingViewModel = context.watch<BookingsViewModel>();

    bookingViewModel.slots = bookingViewModel.generateBookingSlots(
      openTime: barbershop.open_time!,
      closeTime: barbershop.close_time!,
      slotLength: 0.5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 8),
              child: Text(
                "Book Now ",
                style: TextStyle(
                  fontFamily: "MetropolisExtra",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Helper.kTitleTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Click on the card to book the day and time that suits you, ",
                style: TextStyle(
                  height: 1.2,
                  fontFamily: "MetropolisExtra",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 141, 141, 141),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: bookingViewModel.days.length,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, columnIndex) {
              //this is where we generate the slots.
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookingViewModel.days[columnIndex],
                        style: const TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Helper.kTitleTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bookingViewModel.workingDays[columnIndex], //
                        style: const TextStyle(
                          fontFamily: "MetropolisExtra",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Helper.kTitleTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 80,
                    child: ListView.builder(
                      itemBuilder: ((context, rowIndex) {
                        /// gets booking slots based on the day and time

                        return GestureDetector(
                          onTap: () {
                            // here is the logic where we identify the place of the selected slot.
                            //column index is the day
                            //row index is the number of the booking slot
                            if (bookingViewModel.selectedColumn == null &&
                                bookingViewModel.selectedRow == null) {
                              bookingViewModel.selectedColumn = columnIndex;
                              bookingViewModel.selectedRow = rowIndex;
                            } else {
                              bookingViewModel.selectedColumn = null;
                              bookingViewModel.selectedRow = null;
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: bookingViewModel.selectedColumn ==
                                          columnIndex &&
                                      bookingViewModel.selectedRow == rowIndex
                                  ? Helper.kFABColor
                                  : Colors.white,
                              border: Border.all(
                                width: 2,
                                color: bookingViewModel.selectedColumn ==
                                            columnIndex &&
                                        bookingViewModel.selectedRow == rowIndex
                                    ? Helper.kFABColor
                                    : const Color.fromARGB(255, 214, 214, 214),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                bookingViewModel.slots[rowIndex],
                                style: TextStyle(
                                  fontFamily: "MetropolisExtra",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: bookingViewModel.selectedColumn ==
                                              columnIndex &&
                                          bookingViewModel.selectedRow ==
                                              rowIndex
                                      ? Helper.kTextFieldColor
                                      : const Color.fromARGB(
                                          255, 159, 161, 167),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      itemCount: bookingViewModel.slots.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
