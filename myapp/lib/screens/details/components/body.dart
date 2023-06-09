import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';
import 'item_with_title_and_image.dart';
import 'color_and_size.dart';
import 'description.dart';
import 'card_counter.dart';
import 'card_counter_and_btn.dart';
import 'add_to_card.dart';

class Body extends StatefulWidget {
  Body({super.key, required this.product});
  final Product product;

  @override
  State<Body> createState() {
    return _Body();
  }
}

class _Body extends State<Body> {
  var sl = 0;
  void updateSL(int times) {
    setState(() {
      sl = times;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        height: size.height - 40,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              padding: EdgeInsets.only(
                left: kDefaultPaddin,
                right: kDefaultPaddin,
                top: size.height * 0.12,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ColorAndSize(product: widget.product),
                  const SizedBox(
                    height: kDefaultPaddin / 2,
                  ),
                  const Description(),
                  const SizedBox(
                    height: kDefaultPaddin / 2,
                  ),
                  CardCounterAndBtn(updateSL: updateSL),
                  const SizedBox(
                    height: kDefaultPaddin / 2,
                  ),
                  AddToCardAndBuy(product: widget.product, sl: sl)
                ],
              ),
            ),
            ItemWithTitleAndImage(product: widget.product),
          ],
        ),
      ),
    );
  }
}
