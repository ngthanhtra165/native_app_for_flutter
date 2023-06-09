import 'package:flutter/material.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        dummyText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
