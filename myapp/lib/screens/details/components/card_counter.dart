import 'package:flutter/material.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';

class CardCounter extends StatefulWidget {
  const CardCounter({super.key, required this.updateSL});
  final Function(int times) updateSL;

  @override
  State<CardCounter> createState() {
    return _CardCounter();
  }
}

class _CardCounter extends State<CardCounter> {
  int numberOfThing = 1;

  // when you tap on add card
  void addCard() {
    setState(() {
      numberOfThing++;
      widget.updateSL(numberOfThing);
    });
  }

  // when you tap on sub card
  void subCard() {
    if (numberOfThing > 0) {
      setState(() {
        numberOfThing--;
        widget.updateSL(numberOfThing);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOulinedButton(Icons.remove, subCard),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(numberOfThing.toString().padLeft(2, '0'),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOulinedButton(Icons.add, addCard),
      ],
    );
  }

  SizedBox buildOulinedButton(IconData icon, Function press) {
    return SizedBox(
      width: 43,
      height: 32,
      child: OutlinedButton(
        onPressed: () => press(),
        child: Icon(icon),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
