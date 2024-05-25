import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/controllers/home_controller.dart';
import 'package:ecommerce__app_tp/views/cart_screen/cart_screen.dart';
import 'package:ecommerce__app_tp/views/category_screen/category_screen.dart';
import 'package:ecommerce__app_tp/views/homeScreen/home_screen.dart';
import 'package:ecommerce__app_tp/views/profile_screen/profile_screen.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    // init home controller
    var controller=Get.put(HomeController());

  var navbarItem=[
    BottomNavigationBarItem(icon: Image.asset(homeIcon,width: 26),label: home),
    BottomNavigationBarItem(icon: Image.asset(categoyIcon,width: 26),label: categories),
    BottomNavigationBarItem(icon: Image.asset(cartIcon,width: 26),label: cart),
    BottomNavigationBarItem(icon: Image.asset(profileIcon,width: 26),label: account),
  ];

  var navBody =[
  const  ScreenHome(),
  const  ScreenCategory(),
  const  ScreenCart(),
  const  ScreenProfile()
        
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(()=>
         BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          items: navbarItem,
          backgroundColor: grey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor:deeppurple,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          onTap:(value){
            controller.currentNavIndex.value=value;
          } ,
        ),
      ),
    );

  }
}