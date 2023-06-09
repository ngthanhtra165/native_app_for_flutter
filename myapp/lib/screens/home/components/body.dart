import 'package:flutter/material.dart';
import 'package:myapp/constraints.dart';
import 'package:myapp/models/Product.dart';
import 'categories.dart';
import 'package:myapp/screens/home/components/item_card.dart';
import '../../details/detail_screen.dart';
import 'package:myapp/main.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            'Women',
            // ignore: deprecated_member_use
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () {
                  print(1);
                  PlatformChannel.invokeMethod(
                      "moveToNextPageWithIndex", {"index": index});
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
