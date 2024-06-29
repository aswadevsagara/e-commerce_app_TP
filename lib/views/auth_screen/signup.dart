import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/controllers/auth_controller.dart';
import 'package:ecommerce__app_tp/views/homeScreen/home_screen.dart';
import 'package:ecommerce__app_tp/widgets_common/applogo_widget.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';
import 'package:ecommerce__app_tp/widgets_common/custom_textfield.dart';
import 'package:ecommerce__app_tp/widgets_common/our_button.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  bool? isCheck = false;

  var controller = Get.put(AuthController());

  //text controllers

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
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
                        "Signup in to $appname"
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
                        () => Column(
                          children: [
                            customTextField(
                                hint: nameHint,
                                title: name,
                                controller: nameController,
                                obscureText: false),
                            customTextField(
                                hint: emailhint,
                                title: email,
                                controller: emailController,
                                obscureText: false),
                            customTextField(
                                hint: passwordhint,
                                title: password,
                                controller: passwordController,
                                obscureText: true),
                            customTextField(
                                hint: passwordhint,
                                title: retypepassword,
                                controller: passwordRetypeController,
                                obscureText: true),
                            Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: forgetpass.text.make())),
                            Row(
                              children: [
                                Checkbox(
                                    activeColor: deeppurple,
                                    checkColor: white,
                                    value: isCheck,
                                    onChanged: (newValue) {
                                      setState(() {
                                        isCheck = newValue;
                                      });
                                    }),
                                10.widthBox,
                                Expanded(
                                  child: RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                        text: "I agree to the ",
                                        style: TextStyle(
                                            fontFamily: regular, color: grey)),
                                    TextSpan(
                                        text: termsAndCond,
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: deeppurple)),
                                    TextSpan(
                                        text: '&',
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: deeppurple)),
                                    TextSpan(
                                        text: privacyPolicy,
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: deeppurple))
                                  ])),
                                )
                              ],
                            ),
                            controller.isloading.value
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(deeppurple))
                                : ourButton(
                                        title: signup,
                                        color:
                                            isCheck == true ? deeppurple : grey,
                                        onPressed: () async {
                                          if (isCheck != false) {
                                           controller.isloading(true);
                                            try {
                                              await controller
                                                  .signupMethod(
                                                      context: context,
                                                      email: emailController.text,
                                                      password:
                                                          passwordController.text)
                                                  .then((value) {
                                                return controller.storeUserData(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    name: nameController.text);
                                              }).then((value) {
                                                VxToast.show(context,
                                                    msg: loggedin);
                                                Get.offAll(ScreenHome());
                                              });
                                            } catch (e) {
                                              auth.signOut();
                                              VxToast.show(context,
                                                  msg: e.toString());
                                                  controller.isloading(false);
                                            }
                                          }
                                        },
                                        textcol:
                                            isCheck == true ? grey : deeppurple)
                                    .box
                                    .width(context.screenWidth - 50)
                                    .make(),
                            10.heightBox,
                            // Wrapping into gesture detector
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: alreadyHaveAccount,
                                  style:
                                      TextStyle(fontFamily: bold, color: grey)),
                              TextSpan(
                                  text: login,
                                  style: TextStyle(
                                      fontFamily: bold, color: deeppurple))
                            ])).onTap(() {
                              Get.back();
                            }),
                            10.heightBox
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
      ),
    );
  }
}
