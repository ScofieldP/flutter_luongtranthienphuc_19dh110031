import 'package:flutter/material.dart';

class CheckOutCart extends StatelessWidget {
  final double sum;

  const CheckOutCart({Key? key, required this.sum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 50, // set the height here
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(color: Colors.green),
                ),
                backgroundColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              child: Text(
                "Sum: $sum",
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50, // set the height here
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(color: Colors.green),
                ),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              child: Text(
                "Check out".toUpperCase(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
