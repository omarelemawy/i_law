import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../../constants/themes.dart';
import '../../../constants/widget.dart';
import '../../../localization/localization_constants.dart';
import 'add_review_screen.dart';

class ViewAllReviews extends StatefulWidget {
   ViewAllReviews({Key? key}) : super(key: key);


  @override
  _ViewAllReviewsState createState() => _ViewAllReviewsState();
}

class _ViewAllReviewsState extends State<ViewAllReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:customFloatingActionButton(context,text:
      getTranslated(context, "Write Review",)!
      ,onPress:
          (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=>
                AddReviewScreen(
                )));

      }),

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:
        const Icon(Icons.arrow_back_ios,size: 14,)),
        title: customText(" ${getTranslated(context, "Reviews")}     "
            " 5 ",fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 80),
        child: ListView.separated(itemBuilder:
            (context,index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Row(
                     children: [
                       SizedBox(width: 10,),
                       Container(
                         height: 50,
                         width: 50,
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                         decoration:  BoxDecoration(
                           shape: BoxShape.circle,
                         ),
                         child: customCachedNetworkImage(
                           boxFit: BoxFit.cover,
                           context: context,
                           url: "https://media.gettyimages.com/photos/first-person-point-of-view-of-a-woman-paddling-on-a-stand-up-paddle-picture-id1288844323?s=612x612",
                         ),
                       ),
                       SizedBox(width: 15,),
                       Column(
                         children: [
                           customText("gsgsfgswegse",
                               fontWeight: FontWeight.bold,
                               size: 12),
                           SizedBox(height: 5,),
                           RatingStars(
                             editable: false,
                             rating: 2,
                             color: Colors.amber,
                             iconSize: 18,
                           ),
                         ],
                       )
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.all(10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         ExpandableText(
                           "gwsigsighs;gihsghsghasg;hsp;",
                           expandText: getTranslated(context, "show more",)!
                           ,
                           collapseText: getTranslated(context, "show less",)!
                           ,
                           expandOnTextTap: true,
                           maxLines: 5,
                           style: TextStyle(
                               color: HexColor("#9098B1"),
                               fontWeight: FontWeight.w300,
                               fontSize: 12
                           ),
                           linkColor: Colors.blue,
                         ),
                         SizedBox(height: 10,),
                         /*customText("December 10, 2016",size: 10,color:HexColor("#9098B1")),*/
                       ],
                     ),
                   ),
                 ],
               ),
             );
            },
            separatorBuilder: (context,index){
            return const SizedBox(height: 2,);
            },
            itemCount: 5),
      ),
    );
  }
}
