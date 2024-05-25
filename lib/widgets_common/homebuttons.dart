import 'package:ecommerce__app_tp/consts/consts.dart';


Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(grey).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
