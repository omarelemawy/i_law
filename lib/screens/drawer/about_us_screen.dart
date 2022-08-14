import 'package:flutter/material.dart';
import 'package:i_law/localization/localization_constants.dart';

import '../home/my_home_screen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
              (context)=>MyHomeScreen(0)), (route) => false);
        }, icon:
        Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
           getTranslated(context,  "About Us")!
          ,style: TextStyle(
          color: Colors.black,fontSize: 17,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
          ,style: TextStyle(color: Colors.black,fontSize: 17),
        ),
      ),
    );
  }
}
