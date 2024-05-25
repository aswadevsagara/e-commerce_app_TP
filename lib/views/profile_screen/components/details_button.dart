import 'package:ecommerce__app_tp/consts/consts.dart';


Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkgrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkgrey).make()
    ],
  ).box.white.rounded.width(width).height(80).padding(EdgeInsets.all(8)).make();
}
