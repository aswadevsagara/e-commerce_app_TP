

import 'package:ecommerce__app_tp/consts/colors.dart';
import 'package:ecommerce__app_tp/consts/consts.dart';

import 'package:flutter/widgets.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: white,
    child: "Cart is Empty!".text.fontFamily(semibold).color(darkgrey).makeCentered(),
    );
  }
}