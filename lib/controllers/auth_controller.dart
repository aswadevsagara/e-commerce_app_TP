import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce__app_tp/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isloading=false.obs;
  // text controllers
  var emailController=TextEditingController();
  var passController=TextEditingController();

  // login method

   Future<UserCredential?> loginMethod({context}) async{
   UserCredential? userCredential;

   try{
  userCredential =  await auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
   }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
   }
   return userCredential;
   }

   // signup method
   
    Future<UserCredential?> signupMethod({email,password,context}) async{
   UserCredential? userCredential;

   try{
  userCredential =  await auth.createUserWithEmailAndPassword(email: email, password: password);
   }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
   }
   return userCredential;
   }

   // storing date method
  storeUserData({name,password,email}) async{
      DocumentReference store= await firestore.collection(userCollection).doc(currentUser!.uid);
      store.set({
        'name':name,
        'password':password,
        'email': email,
        'imgUrl':" ",
        'id':currentUser!.uid
      });
    }
    // signout method

    signOutMethod({context})async{
      try{
       await auth.signOut();
      }catch(e){
VxToast.show(context, msg: e.toString());
      }
    }
   
}