import 'package:flutter/material.dart';
import 'package:razor_book/helpers/colors.dart';

class CheckOutButtonSheet extends StatelessWidget {
  const CheckOutButtonSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black.withOpacity(0.12),
              width: 1,
              style: BorderStyle.solid),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 8),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Image.asset(
              'assets/images/barber_checkout_logo.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Thank You!',
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 26,
                color: Color(0xff4a4b4d),
                letterSpacing: -0.39,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'for Staying with us',
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 17,
                color: Color(0xff4a4b4d),
                letterSpacing: -0.255,
                fontWeight: FontWeight.w700,
                height: 1.5294117647058822,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: SingleChildScrollView(
                primary: false,
                child: Text(
                  'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 14,
                    color: Color(0xff4a4b4d),
                    letterSpacing: -0.21,
                    height: 1.6428571428571428,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: Helper.kFABColor,
                      fixedSize: Size(MediaQuery.of(context).size.width, 56)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text(
                    'Back To The Home',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )),
            ),
          ],
        ));
  }
}
