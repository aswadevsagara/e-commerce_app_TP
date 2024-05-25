import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/consts/lists.dart';
import 'package:ecommerce__app_tp/widgets_common/our_button.dart';



class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: liteGrey,
      appBar: AppBar(
        backgroundColor: liteGrey,
        elevation: 0,
        title: title!.text.color(darkgrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // swiper section

                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: 3,
                        aspectRatio: 16 / 9,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgCi5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),

                    10.heightBox,

                    // title and details section
                    title!.text
                        .size(16)
                        .color(darkgrey)
                        .fontFamily(semibold)
                        .make(),
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textFieldGrey,
                      selectionColor: gold,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),

                    10.heightBox,

                    "\$30,000"
                        .text
                        .color(Colors.red)
                        .fontFamily(bold)
                        .size(18)
                        .make(),

                    10.heightBox,

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller"
                                  .text
                                  .color(white)
                                  .fontFamily(semibold)
                                  .make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .color(deepDarkGrey)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: white,
                          child: Icon(Icons.message_rounded),
                        )
                      ],
                    )
                        .box
                        .color(grey)
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make(),

                    20.heightBox,
                    // color section
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color :".text.color(darkgrey).make(),
                            ),
                            Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .size(40, 40)
                                        .color(Vx.randomPrimaryColor)
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 6))
                                        .roundedFull
                                        .make())),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // quality row

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity :".text.color(darkgrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(deepDarkGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(o available)".text.color(darkgrey).make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // total row

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Total price :".text.color(darkgrey).make(),
                            ),
                            "\$0.00"
                                .text
                                .size(16)
                                .color(Colors.red)
                                .fontFamily(bold)
                                .make()
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    // Description section
                    10.heightBox,

                    "Description"
                        .text
                        .color(deepDarkGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is a dummy item and dummy desciption here..."
                        .text
                        .color(darkgrey)
                        .make(),

                    // description section
                    10.heightBox,
                    ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            itemDetailsList.length,
                            (index) => ListTile(
                                  title: "${itemDetailsList[index]}"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkgrey)
                                      .make(),
                                  trailing: const Icon(Icons.arrow_forward),
                                )
                                    .box
                                    .color(white)
                                    .margin(EdgeInsets.symmetric(vertical: 5))
                                    .make())),

                                    // products you may like section
                                     20.heightBox,
                                     productsyoumaylike.text.fontFamily(bold).color(darkgrey).size(16).make(),
                                     10.heightBox,
                                     
                                     // i copied this widget from home scren featured products
                                     
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
            ),
          )),
          SizedBox(
            width: double.infinity,
            child: ourButton(
                color: deeppurple,
                onPressed: () {},
                textcol: white,
                title: "Add to cart"),
          )
        ],
      ),
    );
  }
}
