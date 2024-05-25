import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/views/category_screen/item_details.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';

import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deeppurple,
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            bgWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            6,
                            (index) => "Baby Clothing"
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .makeCentered()
                                .box
                                .size(120, 60)
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .white
                                .roundedSM
                                .make())),
                  ),

                  // items container
                  20.heightBox,

                  Expanded(
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 9,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 4),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  banner2,
                                  width: 200,
                                  fit: BoxFit.fill,
                                  height: 100,
                                ),
                                const Spacer(),
                                "laptop 4GB/64GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkgrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .fontFamily(bold)
                                    .size(16)
                                    .color(Colors.red)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .outerShadowSm
                                .padding(const EdgeInsets.all(8))
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .make()
                              .onTap(() {
                                Get.to(()=>ItemDetails(title: "Dummy item"));
                              });
                          }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
