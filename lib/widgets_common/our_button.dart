

import 'package:ecommerce__app_tp/consts/consts.dart';

// class ourButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   ourButton({required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }
// }


Widget ourButton({ VoidCallback? onPressed,Color? color, textcol ,String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: color),
    onPressed:onPressed,
     child: title!.text.fontFamily(bold).color(textcol).make()
    );
}