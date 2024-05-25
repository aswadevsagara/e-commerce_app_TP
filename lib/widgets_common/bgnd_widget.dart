import 'package:ecommerce__app_tp/consts/consts.dart';


Widget bgWidget({Widget? child,double? height }) {
  return Container(
    width: double.infinity,
    height: height,
   decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(bgimg),fit: BoxFit.cover,alignment: Alignment.center,) ),
    
   
    child: child,
  );
}