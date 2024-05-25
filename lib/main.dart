import 'package:ecommerce__app_tp/views/splash_screen/splash_scn.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  
    await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyDgkbQJJHegdk2OyxSUCJ4Jv_rYVWl3PyM",
     appId: "1:920555974204:android:dcb7d6e30c5d1e133b1d39",
      messagingSenderId: "920555974204",
       projectId: "ecommerce-app-tp-caa18")
  );
  
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //we are using getx so we have to change material app in to getmaterialapp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        // scaffoldBackgroundColor: transparant,
        appBarTheme: AppBarTheme(
            // to set appbar icons color
            iconTheme: IconThemeData(color: darkgrey)
            // backgroundColor: transparant,
            ),
        fontFamily: regular,
      ),
      routes: {
        "splash_screen": (context) => const ScreenSplash(),
      },
      initialRoute: "splash_screen",
    );
  }
}
