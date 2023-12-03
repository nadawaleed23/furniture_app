import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/models/items.dart';
import 'package:gap/gap.dart';

import '../layouts.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           Navigator.pop(context);
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => Layout()),
           );
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [Card( elevation: 4,
              child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15)),
                width: double.maxFinite,
                height:300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/istockphoto-1180838091-1024x1024.jpg",fit: BoxFit.fill,),
                ),
              ),
            ),
              Gap(10),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 200,child:Text("Wooden furniture and grey scandinavian sofa with pillows in beautiful living room interior stock photo",maxLines: 4,style: TextStyle(color:  Theme.of(context).colorScheme.onPrimaryContainer))),
                  Text("2500 LE.",style: TextStyle(color:  Theme.of(context).colorScheme.onPrimaryContainer,fontSize: 20,fontWeight: FontWeight.w700),)
                ],
              ),
              Gap(40),
              SizedBox(width: double.maxFinite,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      shadowColor: Theme.of(context).colorScheme.shadow,
                    ),
                    onPressed: () {

                    },
                    child:  Text(
                      "add to cart".toUpperCase(),
                      style: const TextStyle(fontSize: 20),
                    )),
              )
            ],

          ),
        ),
      ),
    );
  }
}
