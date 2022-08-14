import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../books/books_list_vertical.dart';
import 'card_favorite_list_screen.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(getTranslated(context, "Favorites")!,style:
        TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                   Navigator.pop(context);
                  },icon: Icon(Icons.arrow_back_ios,
                    color: Colors.black,size: 25,),),
                  SearchBarAnimation(
                    searchBoxWidth: MediaQuery.of(context).size.width/1.5,
                    durationInMilliSeconds: 500,

                    isOriginalAnimation: true,
                    buttonBorderColour: Colors.white,
                    buttonIcon: Icons.search,
                    onFieldSubmitted: (String value){
                      debugPrint('onFieldSubmitted value $value');
                    }, textEditingController: TextEditingController(),
                  ),
                ],
              ),
            ),*/

            const SizedBox(height: 20,),
            categoresGridView()
          ],
        ),
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
      backgroundColor: Colors.white,
      /*floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 44,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(10)
                  ,bottomLeft:  Radius.circular(10),),
                color: HexColor("#6575A1")
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Icon( CupertinoIcons.arrow_up_arrow_down,color: Colors.white,),
                 SizedBox(width: 10,),
                 Text(
                   getTranslated(context, "Sort")!
                 ,style: const TextStyle(color: Colors.white,fontSize: 17,),)
              ],
            ),
          ),
          const SizedBox(width: .5,),
          Container(
            height: 44,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.filter_list_alt,color: Colors.white,),
                const SizedBox(width: 10,),
                 Text(
                   getTranslated(context, "Filter")!
                  ,style: const TextStyle(color: Colors.white,fontSize: 17,),)
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: const Radius.circular(10)
                  ,bottomRight: const Radius.circular(10),),
                color: HexColor("#6575A1")
            ),
          ),

        ],
      ),*/
    );
  }
  categoresGridView(/*List<Category> list, BuildContext context*/)
  {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CardFavoriteListScreen(/*myContext,lang,phone,list: list, index: index,*/);
      },
      separatorBuilder: (BuildContext context, int index) {
        return  Container(height:.3,color: Colors.grey,
          margin: EdgeInsets.symmetric(horizontal: 30),);
      },);
  }
}

