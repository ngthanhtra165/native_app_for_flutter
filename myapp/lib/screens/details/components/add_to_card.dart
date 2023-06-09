import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/details/detail_screen.dart';

const methodChannel = MethodChannel('methodForDetailScreen');

class AddToCardAndBuy extends StatelessWidget {
  const AddToCardAndBuy({super.key, required this.product, required this.sl});

  final int sl;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            padding: EdgeInsets.all(8),
            width: 58,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: product.color)),
            child: SvgPicture.asset(
              'assets/icons/add_to_cart.svg',
              color: product.color,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                  onPressed: () {
                    methodChannel.invokeMethod("tapToBuyButton" , {"sl" : sl});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: product.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
