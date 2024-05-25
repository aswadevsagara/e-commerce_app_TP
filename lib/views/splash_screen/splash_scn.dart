
import 'package:ecommerce__app_tp/consts/consts.dart';

import 'package:ecommerce__app_tp/views/auth_screen/login_screen.dart';
import 'package:ecommerce__app_tp/views/homeScreen/home_screen.dart';
import 'package:ecommerce__app_tp/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    // controller.repeat();
    controller.forward();

    changeScreen();

    ;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  changeScreen() async {
    await Future.delayed(Duration(seconds: 3));
    //using Getx
    // Get.to(() => const ScreenLogin());
    auth.authStateChanges().listen((User?user) {
      if(user==null){
        Get.to(()=>const ScreenLogin());
      }else{
        Get.to(()=>const ScreenHome());
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deeppurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            ScaleTransition(scale: animation, child: applogoWidget()),
            Padding(
                padding: EdgeInsets.only(right: 30),
                child: appname.text.fontFamily(bold).size(22).white.make()),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            10.heightBox
            // our splash screen UI is completed
          ],
        ),
      ),
    );
  }
}
