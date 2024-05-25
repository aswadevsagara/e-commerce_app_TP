import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/consts/lists.dart';
import 'package:ecommerce__app_tp/controllers/auth_controller.dart';
import 'package:ecommerce__app_tp/views/auth_screen/login_screen.dart';
import 'package:ecommerce__app_tp/views/profile_screen/components/details_button.dart';
import 'package:ecommerce__app_tp/views/profile_screen/components/edit_profilescreen.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';
import 'package:get/get.dart';


class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Stack(
          children: [
            bgWidget(
              height: 500
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //edit profile button

                    const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: white,
                        )).onTap(() {
                          Get.to(()=>EditProfileScreen());
                         }),

                    // user details section

                    Row(
                      children: [
                        Image.asset(imgCi1, width: 100, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Dummy user"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              5.heightBox,
                              "customer@example.com".text.white.make()
                            ],
                          ),
                        ),
                        OutlinedButton(
                            style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: white))),
                            onPressed: () async {
                                 await Get.put(AuthController()).signOutMethod(context: context );
                                 Get.offAll(()=>const ScreenLogin());
                            },
                            child:
                                logout.text.white.fontFamily(semibold).make())
                      ],
                    ),

                    20.heightBox,

                    // details card

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(
                            count: "00",
                            title: "in your cart",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "32",
                            title: "Wish list",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "635",
                            title: "Your orders",
                            width: context.screenWidth / 3.4)
                      ],
                    ),

                    // buttons section
                    40.heightBox,

                    ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.asset(profileButtonIcons[index],width: 22,),
                                title: profielButtonList[index].text.fontFamily(semibold).color(deepDarkGrey).make(),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: liteGrey,
                              );
                            },
                            itemCount: profielButtonList.length)
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make()
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
