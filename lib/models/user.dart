import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel{
  String uid;
  String name;
  String mail;
  String pass;
  String confirmPass;
  String bio;
  String profilePic;
  UserModel({
    required this.uid,
    required this.name,
    required this.mail,
    required this.pass,
    required this.confirmPass,

    required this.bio,
    required this.profilePic,
  });
  factory UserModel.fromSnap(DocumentSnapshot snap){
    var snapShot = snap.data() as Map<String,dynamic>;
    return UserModel(uid: snapShot["uid"],
      name: snapShot["name"],
      mail: snapShot["mail"],
      pass: snapShot["pass"],
      confirmPass: snapShot["confirmPass"],
      bio: snapShot["bio"],
      profilePic:snapShot["profilePic"],);
  }
  // bring data from firebase
  Map<String,dynamic> toJson() => {
    "uid" : uid,
    "name" : name,
    "mail" : mail,
    "pass" : pass,
    "confirmPass": confirmPass,
    "bio" : bio,
    "profilePic" : profilePic,
  };
//send data to firebase

}