

import 'package:flutter/material.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/authors/authors_list_screen.dart';
import 'package:i_law/screens/drawer/policies_screen.dart';
import 'package:i_law/screens/home/my_home_screen.dart';

import '../publishers/publishers_list_screen.dart';
import 'about_us_screen.dart';
import 'contact_us_screen.dart';

class MyDrawerScreen extends StatefulWidget {
  const MyDrawerScreen({Key? key}) : super(key: key);

  @override
  _MyDrawerScreenState createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset("lib/images/Logo.png"),
          ),
          ListTile(
            title:  Text(
          getTranslated(context, "Home")!,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>MyHomeScreen(0)),(_)=>false);
            },
            leading: Icon(Icons.home),
          ),
          Container(
            color: Colors.grey,
            height: .5,
          ),

          ListTile(
            title:  Text(
              getTranslated(context, "Books")!,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>MyHomeScreen(1)),(_)=>false);
            },
            leading: Icon(Icons.menu_book_outlined),
          ),

          Container(
            color: Colors.grey,
            height: .5,
          ),
          ListTile(
            title:  Text(
            getTranslated(context, "Authors")!
              ,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>AuthorsListScreen()),(_)=>false);
            },
            leading: Icon(Icons.person),
          ),

          Container(
            color: Colors.grey,
            height: .5,
          ),
          ListTile(
            title:  Text(
              getTranslated(context, "Publishers")!
              ,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>PublishersListScreen()),(_)=>false);
            },
            leading: Icon(Icons.person),
          ),

          Container(
            color: Colors.grey,
            height: .5,
          ),
          ListTile(
            title:  Text(getTranslated(context, "About Us")!,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>AboutUsScreen()),(_)=>false);
            },
            leading: Icon(Icons.filter_list),
          ),

          Container(
            color: Colors.grey,
            height: .5,
          ),
          ListTile(
            title:  Text(
              getTranslated(context, "Policies")!
              ,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>PoliciesScreen()),(_)=>false);
            },
            leading: Icon(Icons.policy),
          ),

          Container(
            color: Colors.grey,
            height: .5,
          ),
          ListTile(
            title:  Text(
              getTranslated(context, "Contact Us")!
              ,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                  (context)=>ContactUsScreen()),(_)=>false);
            },
            leading: Icon(Icons.support_agent),
          ),
        ],
      ),
    );
  }
}
