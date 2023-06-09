import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/Product.dart';
import '../../../constraints.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';

const methodChannel = const MethodChannel('methodForDetailScreen');

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() {
    return _DetaiScreen();
  }
}

class _DetaiScreen extends State<DetailScreen> {

  Product product = products[0];
  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler(_triggerFromNative);
  }

  Future<void> _triggerFromNative(MethodCall call) async {
    if (call.method == "notifyIndexToFlutter") {
      print("huuuhuhuh");
      print("argument is ${call.arguments}");
      String myVarType = call.arguments.runtimeType.toString();
      print(myVarType);
      setState(() {
        product = products[call.arguments];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: product.color,
        body: Body(
          product: product,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset('assets/icons/back.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          // ignore: deprecated_member_use
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            // ignore: deprecated_member_use
            color: kTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            color: kTextColor,
          ),
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        ),
      ],
    );
  }
}
