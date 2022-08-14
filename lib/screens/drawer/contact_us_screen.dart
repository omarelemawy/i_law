import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';

import '../../constants/color_constans.dart';
import '../home/my_home_screen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:   FloatingActionButton.extended(
          backgroundColor: customColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          onPressed: (){},
          label: Container(
            height: 44,
            width: MediaQuery.of(context).size.width/1.2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(

                color: HexColor("#6575A1")
            ),
            child: Center(child: Text("Send",style:
            TextStyle(color: Colors.white,fontSize: 17,),)),
          )),
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
              (context)=>MyHomeScreen(0)), (route) => false);
        }, icon:
        Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          getTranslated(context, "Contact Us")!
          ,style: TextStyle(
            color: Colors.black,fontSize: 17,
            fontWeight: FontWeight.bold
        ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(getTranslated(context, "Contact Information")!,
                style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20,),
              Text("We will answer any questions you may have about our online sales, rights or partnership service right here.",
                style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              ),
              SizedBox(height: 20,),


              Icon(Icons.location_on,color: Colors.black,),
              SizedBox(height: 10,),

              Row(
                children: [
                  Icon(Icons.email,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("info@freeair.com",style: TextStyle(color: Colors.black),)
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Icon(Icons.phone,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("0501234567",style: TextStyle(color: Colors.black),)
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Icon(Icons.phone,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("0101515155",style: TextStyle(color: Colors.black),)
                ],
              ),
              SizedBox(height: 20,),

              Text(getTranslated(context, "Social Media")!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 30,),


              Text(getTranslated(context, "Tell Us Your Message")!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 010,),
               Row(
                 children: [
                   Expanded(
                     child: TextField(
                       decoration: InputDecoration(
                           labelText: getTranslated(context, "Name"),
                           border: OutlineInputBorder(
                           )
                       ),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Expanded(
                     child: TextField(
                       decoration: InputDecoration(
                           labelText: getTranslated(context, "Email Address")!,
                           border: OutlineInputBorder(
                           )
                       ),
                     ),
                   ),
                 ],
               ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: getTranslated(context, "Company Name"),
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: getTranslated(context, "Selected Country"),
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    labelText: getTranslated(context, "Phone"),
                    border: OutlineInputBorder(
                    )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    labelText: getTranslated(context, "Title"),
                    border: OutlineInputBorder(
                    )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    labelText: getTranslated(context, "Select subject"),
                    border: OutlineInputBorder(
                    )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                maxLines: 4,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                    labelText: getTranslated(context, "Your Message")!,
                    border: OutlineInputBorder(
                    )
                ),
              ),

              SizedBox(height: 120,),
            ],
          ),
        ),
      ),

    );
  }
}
