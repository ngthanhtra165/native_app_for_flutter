import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constraints.dart';
import 'card_counter.dart';

class CardCounterAndBtn extends StatelessWidget {
  const CardCounterAndBtn({super.key, required this.updateSL});

  final Function(int times) updateSL;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardCounter(updateSL: updateSL),
        Container(
          padding: EdgeInsets.all(8),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/heart.svg'),
        )
      ],
    );
  }
}
