import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/home_body.dart';
import '../../app/control.dart';
import '../../app/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key ,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _auth = FirebaseAuth.instance;
HomeScreenController controller = Get.find();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            const UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text("john.doe@example.com"),

          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle home screen navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
            },
          ),
          const Divider(),
          ListTile(
            leading:  const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              try {
                await _auth.signOut(); // سجل الخروج من Firebase
                Navigator.pop(context); //
              } catch (e) {
                print('$e');
              }
            },
          ),
        ],
      ),),
      backgroundColor: Colors.purple,
      appBar: homeAppar(context),
      body: const HomeBody(),
    );
  }

  AppBar homeAppar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      title: const Text(
        'مرحبا بكم في متجر الالكترونيات',
        // style: GoogleFonts.getFont('Almarai'),
      ),
      actions: [
        Row(
          children: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.shoppingCart);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    )),
                GetBuilder<HomeScreenController>(builder: (controller) {
                  return Positioned(
                      right: 3,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Text('${controller.cartCount}'),
                      ));
                })
              ],
            ),
            IconButton(
              icon: const Icon(Icons.close_outlined),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    );
  }


}


