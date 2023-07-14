import 'package:adi_project/Project-1/Screens/Category_List/Components/Category_List.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [UserHeader(),
          ListTile(
            leading: Icon(Icons.add_box,color: Colors.indigo),
            title: Text('Manage Category'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList(),));

            },
          ),
          ListTile(
            leading: Icon(Icons.add_box,color: Colors.indigo),
            title: Text('Manage Product'),
          )],
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
