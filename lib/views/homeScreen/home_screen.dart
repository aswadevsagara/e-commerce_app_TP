
import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/consts/lists.dart';
import 'package:ecommerce__app_tp/views/homeScreen/components/featured_button.dart';
import 'package:ecommerce__app_tp/widgets_common/homebuttons.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(12),
        color: liteGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
            child: Column(
          children: [
            Container(
              color: liteGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: searchAnything,
                    hintStyle: TextStyle(color: textFieldGrey),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //swiper brands
                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        height: 150,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 12))
                                .make(),
                          );
                        }),
                    10.heightBox,
      
                    // deals button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          2,
                          (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.2,
                              icon: index == 0 ? todaysDealIcon : flashSaleIcon,
                              title: index == 0 ? todayDeal : flashsale)),
                    ),
      
                    // second swiper
                    10.heightBox,
                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        // enableInfiniteScroll: false,
                        isFastScrollingEnabled: true,
                        // pauseAutoPlayOnTouch: Duration(seconds: 3),
                        height: 150,
                        aspectRatio: 16 / 9,
                        autoPlay: false,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 12))
                                .make(),
                          );
                        }),
                    //category buttons
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 3.5,
                              icon: index == 0
                                  ? topCategoriesIcon
                                  : index == 1
                                      ? brandIcon
                                      : topSellerIcon,
                              title: index == 0
                                  ? topCategories
                                  : index == 1
                                      ? brand
                                      : topSellers)),
                    ),
                    // featured categories
                    10.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text
                            .color(black)
                            .size(18)
                            .fontFamily(semibold)
                            .make()),
                    20.heightBox,
      
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        icon: featuredListimg1[index],
                                        title: featuredTitle1[index]),
                                    10.heightBox,
                                    featuredButton(
                                        icon: featuredListimg2[index],
                                        title: featuredTitle2[index])
                                  ],
                                )),
                      ),
                    ),
      
                    // featured products
                    20.heightBox,
      
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            banner1,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          "laptop"
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
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .roundedSM
                                          .padding(const EdgeInsets.all(8))
                                          .make()),
                            ),
                          ),
                        ],
                      ),
                    ),
      
                    // third swiper
                    20.heightBox,
                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        // enableInfiniteScroll: false,
                        isFastScrollingEnabled: true,
                        // pauseAutoPlayOnTouch: Duration(seconds: 3),
                        height: 150,
                        aspectRatio: 16 / 9,
                        autoPlay: false,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 12))
                                .make(),
                          );
                        }),
      
                    // all products sectios
      
                    20.heightBox,
                   
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing:8
                          ),
                           itemBuilder: (context,index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(banner2,width: 200,
                                fit: BoxFit.fill,height: 100,),
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
                            ).box.white.padding(const EdgeInsets.all(8)).margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
                           })
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
