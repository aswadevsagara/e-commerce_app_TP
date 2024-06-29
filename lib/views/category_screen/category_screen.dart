import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/consts/lists.dart';
import 'package:ecommerce__app_tp/views/category_screen/category_details.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deeppurple,
        elevation: 0,
        title: categories.text.white.fontFamily(bold).make(),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            bgWidget(height: 0),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: categoriesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            categoryImages[index],
                            height: 130,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          "${categoriesList[index]}"
                              .text
                              .color(darkgrey)
                              .align(TextAlign.center)
                              .make()
                        ],
                      )
                          .box
                          .white
                          .rounded
                          .clip(Clip.antiAlias)
                          .outerShadowSm
                          .make()
                          .onTap(() {
                        Get.to(() => CategoryDetails(
                              title: categoriesList[index],
                            ));
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
