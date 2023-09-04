import 'package:adi_project/Project-1/Screens/Category_List/Components/Category_List.dart';
import 'package:adi_project/Project-1/Screens/Product_List/Components/Product_LIst.dart';
import 'package:adi_project/Project-1/Screens/Sign_in/Sigin_Screen.dart';
import 'package:adi_project/Project-1/firebase/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer(String? firstName, String? email);

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    return Drawer(
      child: ListView(
        children: [UserHeader(),
          ListTile(
            leading: Icon(Icons.add_box, color: Colors.indigo),
            title: Text('Manage Category'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryList(),));
            },
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(),)),
            leading: Icon(Icons.add_box, color: Colors.indigo),
            title: Text('Manage Product'),
          ),
          ListTile(onTap: () {
            service.signOut().then((value) =>
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => SiginForm(),), (
                        route) => false));
          },
            leading: Icon(Icons.add_box, color: Colors.indigo),
            title: Text('Logout'),
          )
        ],
      ),
    );
  }

  UserHeader() {
    return UserAccountsDrawerHeader(
        currentAccountPicture: Image.asset("assets/images/profile (3).png"),
        accountName: Text("Aditya Babariya"),
        accountEmail: Text("adityaabbariya@gmail.com"));
  }
}
