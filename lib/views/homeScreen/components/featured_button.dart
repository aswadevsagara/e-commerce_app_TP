import 'package:ecommerce__app_tp/consts/consts.dart';


Widget featuredButton({String? title,icon}){
  return Row(
    children: [
      Image.asset(icon,width: 80,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkgrey).make()
    ],
  ).box.roundedSM.white.padding(EdgeInsets.all(8)).margin(EdgeInsets.symmetric(horizontal: 4)).width(200).outerShadowSm.make();
}