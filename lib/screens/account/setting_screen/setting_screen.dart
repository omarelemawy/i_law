import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/account/setting_screen/profile_screen.dart';
import 'package:i_law/screens/account/setting_screen/setting_bloc/setting_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../constants/color_constans.dart';
import '../../../constants/themes.dart';
import '../../../constants/widget.dart';
import '../../../models/language.dart';
import '../../home_body/notifications_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}
bool obscureOldPassword=true;
bool obscureNewPassword=true;
bool obscureNewConfirmPassword=true;
TextEditingController oldPassController=TextEditingController();
TextEditingController newPassController=TextEditingController();
TextEditingController confirmPassController=TextEditingController();
final _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon:
              Icon(Icons.arrow_back_ios,
                color: Colors.black, size: 25,)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    getTranslated(context, "Settings")!
                  , style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                  getTranslated(context, "Account")!
                  , style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 15,),





                ListTile(
                  title: customText(getTranslated(context, "Profile")!,
                      color: Colors.black, size: 17),
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#6575A1")
                    ),
                    child: Icon(Icons.person_outline, color: Colors.white,),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: ProfileScreen(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation
                          .cupertino,
                    );
                  },
                ),



                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),


                ListTile(
                  onTap: ()
                  {
                    pushNewScreen(
                      context,
                      screen:  NotificationsScreen(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#6575A1")
                    ),
                    child: Icon(Icons.notifications, color: Colors.white,),
                  ),
                  title: Text(getTranslated(context, "Notifications")!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#6575A1")
                    ),
                    child: Icon(Icons.logout, color: Colors.white,),
                  ),
                  title: Text(getTranslated(context, "Sign Out")!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),

                SizedBox(height: 40,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(getTranslated(context, "More Options")!, style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 20,),



                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(getTranslated(context, "Currency")!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    Spacer(),
                    DropdownButton<Currency>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      icon: Row(
                        children: [
                          Text("\$-USD",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                      onChanged: (Currency? language) {

                      },
                      items: Currency.languageList()
                          .map<DropdownMenuItem<Currency>>(
                            (e) =>
                            DropdownMenuItem<Currency>(
                              value: e,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(e.name)
                                ],
                              ),
                            ),
                      )
                          .toList(),
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),

                SizedBox(height: 20,),


                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(getTranslated(context, "Languages")!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    Spacer(),
                    DropdownButton<Language>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      icon: Row(
                        children: [
                          Text(getTranslated(context, "English")!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                      onChanged: (Language? language) {
                        SettingCubit.get(context)
                            .changeLanguage(language!, context);
                      },
                      items: Language.languageList()
                          .map<DropdownMenuItem<Language>>(
                            (e) =>
                            DropdownMenuItem<Language>(
                              value: e,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    e.flag,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(e.name)
                                ],
                              ),
                            ),
                      )
                          .toList(),
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),


                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(getTranslated(context, "Linked Accounts")!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    Spacer(),
                    Text("Facebook, Google",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),

              ],
            ),
          );
        },
      ),
    );
  }

}
