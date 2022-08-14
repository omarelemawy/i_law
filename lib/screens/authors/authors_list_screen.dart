import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/home/my_home_screen.dart';

import '../../constants/widget.dart';
import 'authors_screen.dart';

class AuthorsListScreen extends StatefulWidget {
  const AuthorsListScreen({Key? key}) : super(key: key);

  @override
  _AuthorsListScreenState createState() => _AuthorsListScreenState();
}

class _AuthorsListScreenState extends State<AuthorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
              (context)=>MyHomeScreen(0)), (route) => false);
        }, icon:
        Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20,),
              Text(getTranslated(context, "Authors")!,
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                  fontSize: 34
              ),),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(itemBuilder:
                (context, index) => InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> Authors()
                    ));
                  },
                    child: cardAuthors(context))
                , separatorBuilder: (context, index) =>
                    SizedBox(height: 20,)
                , itemCount: 30),
          )
        ],
      ),
    );
  }
}
Widget cardAuthors(context){
  return Container(
    child: Row(
      children: [
        Row(
          children: [
            const SizedBox(width: 10,),
            Container(
              height: 80,
              width: 80,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:  const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: customCachedNetworkImage(
                boxFit: BoxFit.cover,
                context: context,
                url: "https://media.istockphoto.com/photos/lens-image-dslr-manhattan-downtown-city-new-york-hand-picture-id901169654?k=20&m=901169654&s=612x612&w=0&h=BEzK22AQ7PrtCrIrIL92l7YvENVBLqE7Qurxu4m5iD4=",
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gerard Fabiano",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "Leila’s Story",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: HexColor("#666666"),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20,),
          ],
        )
      ],
    ),
  );
}