



List<String> getSlots(String _givenOpen, String _givenClose, double _slotLength) {


  double slotLength = _slotLength;
  var slots = <String>[];
  String givenOpen = _givenOpen;
  String givenClose = _givenClose;
  bool loop = true;

  int openHour = int.parse(givenOpen.substring(0, 2));
  int openMinute = int.parse(givenOpen.substring(3, givenOpen.length));

  int closeHour = int.parse(givenClose.substring(0, 2));
  int closeMinute = int.parse(givenClose.substring(3, givenClose.length));

  int prevHour = openHour;
  int prevMinute = openMinute;

  String tempHour = '$prevHour';
  String tempMinute = '$prevMinute';

  if (slotLength == 0.5) {
    while (loop) {
      //print("outer");
      if ((prevMinute + 30) >= 60) {
        if (prevHour > closeHour || ((prevHour == closeHour) && prevMinute > closeMinute)) {
          loop = false;
        } else {
          tempHour = '$prevHour';
          tempMinute = '$prevMinute';

          if (tempHour.length == 1) {
            tempHour = '0$prevHour';
          }
          if (tempMinute.length == 1) {
            tempMinute = '0$prevMinute';
          }
          if (!(closeHour == prevHour && (prevMinute + 30) > (closeMinute))) {
            slots.add('$tempHour:$tempMinute');
          }
          prevHour += 1;
          prevMinute -= 30;
        }
      } else {
        if (prevHour > closeHour || prevMinute > closeMinute) {
          loop = false;
        } else {
          tempHour = '$prevHour';
          tempMinute = '$prevMinute';

          if (tempHour.length == 1) {
            tempHour = '0$prevHour';
          }
          if (tempMinute.length == 1) {
            tempMinute = '0$prevMinute';
          }
          if (!(closeHour == prevHour && (prevMinute + 30) > (closeMinute))) {
            slots.add('$tempHour:$tempMinute');
          }
          prevMinute += 30;
          //print('down');
        }
      }
    }
  } else {
    while (loop) {
      if (prevHour < closeHour ||
          (prevHour == closeHour && closeMinute == 59)) {
        tempHour = '$prevHour';

        if (tempHour.length == 1) {
          tempHour = '0$prevHour';
        }
        if (tempMinute.length == 1) {
          tempMinute = '0$prevMinute';
        }

        slots.add('$tempHour:$tempMinute');
        prevHour += 1;
      } else {
        loop = false;
      }
    }
  }

  //print(slots);
  return slots;
}
