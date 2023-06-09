import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function() press;

  const ItemCard({super.key, required this.product, required this.press});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: const TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
