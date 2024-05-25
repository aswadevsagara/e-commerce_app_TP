
import 'package:ecommerce__app_tp/consts/consts.dart';

import 'package:shimmer/shimmer.dart';

Widget applogoWidget(){
  // using velocity x here
  return Shimmer.fromColors(
    baseColor: grey,
    highlightColor:white ,
    child: Image.asset(logo).box.size(200,200).padding(const EdgeInsets.all(8)).rounded.make());
}