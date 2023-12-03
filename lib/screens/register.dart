import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../layouts.dart';
import '../services/auth.dart';
import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isvisible = true;
  bool isvisible2 = true;

  TextEditingController mailTextEditing = TextEditingController();
  TextEditingController userTextEditing = TextEditingController();
  TextEditingController confirmTextEditing = TextEditingController();

  TextEditingController passTextEditing = TextEditingController();

  register() async {
    try {
      String res = await AuthMethods().signUp(
          name: userTextEditing.text,
          mail: mailTextEditing.text,
          pass: passTextEditing.text,
          confirmPass: confirmTextEditing.text);
      if (res == "success") {

      } else {
        print(res);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: SvgPicture.asset(
                        "assets/svg/7088676_3546925.svg",
                        height: 200,
                        width: 200,
                      )),
                      //logo
                      const Text(
                        "We are GLAD to see you..",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const Gap(30),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this filed must be filled";
                          }
                          return null;
                        },
                        controller: userTextEditing,
                        onChanged: (value) {
                          print(value);
                        },
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const Gap(20),
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
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
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
                          } else {
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this filed must be filled";
                          } else if (value!.length < 5) {
                            return "the password is too short";
                          } else {
                            return null;
                          }
                        },
                        controller: confirmTextEditing,
                        onChanged: (value) {
                          print(value);
                        },
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        obscureText: isvisible2,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisible2 = !isvisible2;
                                  });
                                },
                                icon: Icon(isvisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                      const Gap(20),

                      SizedBox(
                          height: 60,
                          width: double.maxFinite,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                shadowColor:
                                    Theme.of(context).colorScheme.shadow,
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  register();
                                  print(mailTextEditing.text);
                                  print(passTextEditing.text);
                                  // await ApiProvider().loginUser(email: mailTextEditing.text, password: passTextEditing.text);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Layout()),
                                  );
                                }
                              },
                              child: const Text(
                                "Agree and register",
                                style: TextStyle(fontSize: 20),
                              ))),
                      const Gap(20),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you already have an account ?",
                            style: TextStyle(fontSize: 13),
                          ),
                          Gap(10),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                "login",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ))
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
