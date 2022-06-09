import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razor_book/helpers/colors.dart';

class ViewWorkingDaysByChips extends StatelessWidget {
  const ViewWorkingDaysByChips({Key? key, required this.workingDays})
      : super(key: key);
  final List<dynamic> workingDays;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52.0),
        child: SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: workingDays.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  backgroundColor: Helper.kFABColor,
                  padding: const EdgeInsets.all(0),
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      workingDays[index],
                      style: const TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
