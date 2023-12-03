import 'package:flutter/material.dart';
import 'package:furniture_app/models/items.dart';
import 'package:furniture_app/models/user.dart';
import 'package:furniture_app/screens/test_item.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                "Make Home",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primaryContainer),
              ),
              Text(
                "BEAUTIFUL",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .onPrimary,
        child: ListView(
          shrinkWrap: true,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondary),
              accountName: Text(
                'username..',
                style: TextStyle(color: Theme
                    .of(context)
                    .colorScheme
                    .scrim),
              ),
              accountEmail: Text(
                "example2002@gmail.com",
                style: TextStyle(color: Theme
                    .of(context)
                    .colorScheme
                    .scrim),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: const AssetImage("assets/images/girl.jpg"),
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .onSecondary,
              ),
            ),
            ListTile(
              trailing:const Icon(Icons.arrow_forward_ios_outlined),
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation to the home screen.
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Handle navigation to the home screen.
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              leading: const Icon(Icons.security),
              title: const Text('Security'),
              onTap: () {
                // Handle navigation to the home screen.
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),

          child: Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 20.0,
                  ), itemCount: item.length ,
                  itemBuilder: (context , index){
                    return   GestureDetector( onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Test()),
                      );
                    },
                      child: Container(
                height: 200,
                decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15)),
                child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(item[index].image,fit: BoxFit.cover,),


                ),
                Padding(
                padding:const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                child: Icon(
                Icons.favorite,
                color:  item[index].status == "fav"
                      ? Colors.red
                      : Colors.white,
                ),
                ),
                )
                ],
                ),
                ),
                    );
              })),

      ),
    );
  }
}

