import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/account/setting_screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import 'favorite_list.dart';
import 'favorite_list_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.grey[100],
         /*leading: IconButton(onPressed:
             (){
               pushNewScreen(
                 context,
                 screen: SettingScreen(),
                 withNavBar: false, // OPTIONAL VALUE. True by default.
                 pageTransitionAnimation: PageTransitionAnimation.cupertino,
               );
             }
             , icon:Icon(CupertinoIcons.settings,
           color: Colors.black
           ,)),*/
       ),

       body: Column(
         children: [
           Container(
             color: Colors.grey[100],
             child: Column(
               children: [
                 SizedBox(height: 10,),

                 InkWell(
                   onTap: (){
                     pushNewScreen(
                       context,
                       screen: SettingScreen(),
                       withNavBar: false, // OPTIONAL VALUE. True by default.
                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                     );
                   },
                   child: Row(
                     children: [
                       SizedBox(
                         width: 20,
                       ),
                       Stack(
                         alignment: Alignment.bottomRight,
                         children: [
                           Container(
                             height: 86,
                             width: 86,
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle
                             ),
                             child: customCachedNetworkImage(
                               boxFit: BoxFit.cover,
                               context: context,
                               url: "https://apod.nasa.gov/apod/image/0407/moussette_aur16jul1_full.jpg",
                             ),
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
                       SizedBox(
                         width: 20,
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Elizabeth Sanders",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 24,
                               fontWeight: FontWeight.bold
                             ),),
                           SizedBox(height: 5,),
                           Text("elizabeth@mail.com",
                             style: TextStyle(
                               color: Colors.grey,
                               fontSize: 15,
                             ),),
                         ],
                       ),

                     ],
                   ),
                 ),

                 SizedBox(height: 20,),
                 Row(
                   children: [
                         SizedBox(width: 20,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "53",
                               style:
                               TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold),
                             ),
                             Text(
                             getTranslated(context, "Bookmark")!,
                               style:
                               TextStyle(
                                   color: Colors.grey,),
                             ),

                           ],
                         ),
                         SizedBox(width: MediaQuery.of(context).size.width/2.3,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "53",
                               style:
                               TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold),
                             ),
                             Text(
                               getTranslated(context,"Finished Books")!,
                               style:
                               TextStyle(
                                   color: Colors.grey,),
                             ),

                           ],
                         ),


                   ],
                 ),
                 SizedBox(height: 20,),
               ],
             ),
           ),
           SizedBox(height: 20,),
           Row(
             children: [
               const SizedBox(width: 20,),
               customText(getTranslated(context, "Favorites")!
                   , color: Colors.black,
                   fontWeight: FontWeight.bold, size: 17),
               const Spacer(),
               InkWell(
                 onTap: () {
                   pushNewScreen(
                     context,
                     screen: FavoriteListScreen(),
                     withNavBar: false, // OPTIONAL VALUE. True by default.
                     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                   );
                 },
                 child: Row(
                   children: [
                     customText(
                         getTranslated(context, "See all")!
                         , color: HexColor("#8A8A8F"),
                         fontWeight: FontWeight.w400,
                         size: 12),
                     Icon(Icons.arrow_forward_ios,
                         color: HexColor("#8A8A8F"), size: 12)
                   ],
                 ),
               ),
               const SizedBox(width: 20,)
             ],
           ),
           SizedBox(height: 20,),
           Row(
             children: [
               SizedBox(
                 width: 15,
               ),
               Expanded(child: FavoriteList()),
             ],
           )

         ],
       ),

    );
  }
}
