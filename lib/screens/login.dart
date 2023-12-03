import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/screens/register.dart';
import 'package:furniture_app/services/auth.dart';
import 'package:gap/gap.dart';

import '../layouts.dart';
import '../utils/custom_snack_bar.dart';
import 'home.dart';


class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isvisible = true;

  TextEditingController mailTextEditing = TextEditingController();

  TextEditingController passTextEditing = TextEditingController();
  /*signIn()async{
   try {
     String res=await AuthMethods().signIn(mail: mailTextEditing.text, pass: passTextEditing.text);
     if(res=="success"){print("done");
     }else{print(res);}
   } on Exception catch (e) {
    print(e);
   }
  }*/

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: SvgPicture.asset(
                              "assets/svg/7088676_3546925.svg",
                              height: 200,
                              width: 200,
                            ))
                        //logo

                        ,
                        const Text(
                          "HELLO .. WELCOME BACK",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        //welcome

                        const Gap(30),
                        TextFormField(
                          validator: (value) {
                            final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (emailValid == false) {
                              return " mail must be valid";
                            } else if (value!.isEmpty) {
                              return "this filed must be filled";
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: mailTextEditing,
                          onChanged: (value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          decoration:  InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            prefixIcon: const Icon(Icons.mail),
                          ),
                        ),
                        const Gap(20),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this filed must be filled";
                            } else if (value!.length < 5) {
                              return "the password is too short";
                            }
                            else {
                              return null;
                            }
                          },
                          controller: passTextEditing,
                          onChanged: (value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          obscureText: isvisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                  },
                                  icon: Icon(isvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        const Gap(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forget ur Password?",
                            ),
                          ],
                        ),
                        const Gap(20),
                        SizedBox(
                            height: 60,
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  shadowColor: Theme.of(context).colorScheme.shadow,
                                ),
                                onPressed: () async {
                                  /*signIn();
                                  if (formKey.currentState!.validate()) {
                                    print(mailTextEditing.text);
                                    print(passTextEditing.text);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Layout()),
                                    );
                                  }*/
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: mailTextEditing.text,
                                          password: passTextEditing.text
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Layout()),
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        customSnackBar(context, "No user found for that email.");
                                      } else if (e.code == 'wrong-password') {
                                        customSnackBar(context, "Wrong password provided for that user.");
                                      }
                                      else{
                                        customSnackBar(context, "No user found for that email.");
                                      }
                                    }
                                    catch (e) {
                                      customSnackBar(context, e.toString());
                                    }
                                  }


                                },
                                child:  Text(
                                  "Login".toUpperCase(),
                                  style: const TextStyle(fontSize: 20),
                                ))
                        ),
                        const Gap(20),
                        Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have any account ?",
                                ),
                                Gap(10),
                                GestureDetector(onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },child: Text("register now",style: TextStyle(fontSize: 13,color: Theme.of(context).colorScheme.primary),))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}