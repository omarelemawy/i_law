import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/color_constans.dart';
import '../../../constants/themes.dart';
import '../../../constants/widget.dart';
import '../../../localization/localization_constants.dart';
import 'edit_profile_bottom_screen.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
   XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          /*MySharedPreferences().getUserUserEmail().then((value){
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context)=>
                    HomeScreen
                      (Localizations.localeOf(context).languageCode,3
                      ,email: value,)),
                    (route) => false);
          });*/
        }, icon:
        Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 1,
        title: customText(getTranslated(context,"Profile",)!,
          fontWeight: FontWeight.bold,color: Colors.black,size: 17),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: ()async{
                      final ImagePicker _picker = ImagePicker();
                      image = await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                      });
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: image==null?
                          customCachedNetworkImage(
                            boxFit: BoxFit.cover,
                            context: context,
                            url: "https://media.gettyimages.com/photos/first-person-point-of-view-of-a-woman-paddling-on-a-stand-up-paddle-picture-id1288844330?s=612x612",
                          ):Image.file(File(image!.path),fit: BoxFit.fill,),
                        ),
                        Container(
                          height: 32,
                          width: 32,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor("#6575A1")
                          ),
                          child: Icon(Icons.edit,color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      customText(
                          "sgojus0pgojsrd",
                          fontWeight: FontWeight.bold,
                          size: 14),
                      SizedBox(height: 5,),
                      customText("ujsgvhjsnasv",fontWeight: FontWeight.w100,
                          color: HexColor("#9098B1"),size: 11)
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),

              ListTile(
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,6);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.person_outline,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    Expanded(
                      child: customText(
                          getTranslated(context,"Name",)!
                          ,fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Expanded(child: customText("vashvioshvi",color: HexColor("#9098B1"))),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
              ),
              /*ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.male,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    customText(
                        getTranslated(context,"Gender",)!
                        ,fontWeight: FontWeight.bold),
                    Spacer(),
                    customText(profileData.data!.gender??"",color: HexColor("#9098B1")),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,1);
                },
              ),*/
              ListTile(
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,2);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.date_range,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    customText(
                        getTranslated(context,"Birthday",)!
                        ,
                        fontWeight: FontWeight.bold),
                    Spacer(),
                    customText("hvdoiuhysdvuihsad",color: HexColor("#9098B1")),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
              ),

              ListTile(
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,3);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.email_outlined,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    Expanded(
                      child: customText(
                          getTranslated(context,"Email",)!
                          ,fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Expanded(child: customText("svdbvsdbvsdv",color: HexColor("#9098B1"))),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
              ),

              ListTile(
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,4);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.phone_iphone_rounded,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    customText(
                        getTranslated(context,"Phone Number",)!
                        ,
                        fontWeight: FontWeight.bold),
                    Spacer(),
                    customText("0251684501",color: HexColor("#9098B1")),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
              ),

              ListTile(
                onTap: (){
                  showMyBottomSheet(_scaffoldKey,5);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                leading: Icon(Icons.lock_outline_rounded,color: HexColor("#40BFFF"),),
                title: Row(
                  children: [
                    customText(
                        getTranslated(context,"Change Password",)!
                        ,fontWeight: FontWeight.bold),
                    Spacer(),
                    customText("•••••••••••••••••",color: HexColor("#9098B1")),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: HexColor("#9098B1"),size: 12,),
              ),

              SizedBox(height: 60,),
             customFloatingActionButton(context,
                  onPress: (){
                    if(image!=null){

                    }
                    else{

                    }
                  },
                  text: getTranslated(context, "Save All Data")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
