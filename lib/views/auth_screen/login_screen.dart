import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/consts/lists.dart';
import 'package:ecommerce__app_tp/controllers/auth_controller.dart';
import 'package:ecommerce__app_tp/views/auth_screen/signup.dart';
import 'package:ecommerce__app_tp/views/homeScreen/home.dart';
import 'package:ecommerce__app_tp/views/homeScreen/home_screen.dart';
import 'package:ecommerce__app_tp/widgets_common/applogo_widget.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';
import 'package:ecommerce__app_tp/widgets_common/custom_textfield.dart';
import 'package:ecommerce__app_tp/widgets_common/our_button.dart';

import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              child: Column(
                children: [
                  bgWidget(
                    height: 300,
                      child: Column(
                    children: [
                      Center(child: applogoWidget()),
                      "Log in to $appname"
                          .text
                          .color(Colors.white)
                          .size(20)
                          .make(),
                      10.heightBox,
                    ],
                  )),
                ],
              ),
            ),
            Positioned(
              top: 240,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      ()=> Column(
                        children: [
                          customTextField(hint: emailhint, title: email,obscureText: false,controller: controller.emailController),
                          customTextField(hint: passwordhint, title: password,obscureText: true,controller: controller.passController),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: forgetpass.text.make())),
                       controller.isloading.value? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(deeppurple),)  : ourButton(
                                  title: login,
                                  color: deeppurple,
                                  onPressed: () async{
                                   
                                      controller.isloading(true);
                                  await controller.loginMethod(context: context).then((value){
                                    if(value!=null){
                                      VxToast.show(context, msg: loggedin);
                                      Get.offAll(()=>Home());
                                    }else{
                                      controller.isloading(false);
                                    }
                                  });
                                  },
                                  textcol: grey)
                              .box
                              .width(context.screenWidth - 50)
                              .make(),
                          5.heightBox,
                          createNewAccount.text.color(grey).make(),
                          5.heightBox,
                          ourButton(
                                  title: signup,
                                  color: litePurple,
                                  onPressed: () async{
                                   Get.to(() => ScreenSignUp());
                                  },
                                  textcol: deeppurple)
                              .box
                              .width(context.screenWidth - 50)
                              .make(),
                          5.heightBox,
                          loginWith.text.color(grey).make(),
                          5.heightBox,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  2,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: liteGrey,
                                          child: Image.network(
                                            socialIconList[index],
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                          radius: 25,
                                        ),
                                      ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
