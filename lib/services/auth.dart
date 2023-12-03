import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';


class AuthMethods{
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  signUp(
      {
        required String name,
        required String mail,
        required String pass,
        required String confirmPass,
      }) async{
    String res = "some ERRORS";

    try {
      if(name.isNotEmpty || mail.isNotEmpty || pass.isNotEmpty || confirmPass.isNotEmpty){
        UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: mail, password: pass);
        UserModel userModel = UserModel(uid: userCredential.user!.uid,
            name: name, mail: mail, pass: pass,confirmPass:confirmPass ,bio: "", profilePic: "");
        users.doc( userCredential.user!.uid).set(userModel.toJson());
        res= "success";
      }
      else{
        res = "you must filled all fields";
      }
    } on Exception catch (e) {
      return e.toString();

    }
    return res;
  }
  signIn(
      {

        required String mail,
        required String pass,

      }) async{
    String res = "some ERRORS";

    try {
      if( mail.isNotEmpty || pass.isNotEmpty){
        _auth.signInWithEmailAndPassword(email: mail, password: pass);
        res="success";
      }
      else{
        res = "you must filled all fields";
      }
    } on Exception catch (e) {
      return e.toString();

    }
    return res;
  }
}