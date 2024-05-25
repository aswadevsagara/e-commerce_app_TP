
import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:ecommerce__app_tp/widgets_common/bgnd_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:deeppurple ,
      ),
      body: Container(
            width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            bgWidget(
              height: 100,
             
            )
          ],
        ),
      ),
    );
  }
}