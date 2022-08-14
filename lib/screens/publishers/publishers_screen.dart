import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import '../books/popular_books_list.dart';

class PublishersScreen extends StatefulWidget {
  const PublishersScreen({Key? key}) : super(key: key);

  @override
  _PublishersScreenState createState() => _PublishersScreenState();
}

class _PublishersScreenState extends State<PublishersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:
        Icon(Icons.arrow_back_ios,
          size: 25,color: Colors.black,)),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(height: 20,),
              Text("Amanda Lockwood",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28
              ),),
              SizedBox(height: 20,),
              Text("837",style: TextStyle(
                color: Colors.grey,
                fontSize: 17
              ),),
              Text(getTranslated(context, "Books")!,style: TextStyle(
                color: Colors.grey[700],
                fontSize: 17
              ),),
              SizedBox(height: 60,),
              Row(
                children: [
                  Text(getTranslated(context, "About")!,style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height: 20,),
              ExpandableText(
                "Amanda is an American writer, best known for her romance novels. She is the bestselling author alive and the fourth bestselling fiction author of all time, with over 800 million copies sold. She has written 179 books, in ….read more",
                expandText: getTranslated(context, "read more")!,
                 expandOnTextTap: true,
                 collapseOnTextTap: true,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 15
                 ),
                collapseText: getTranslated(context, "show less",)!
                ,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  customText(getTranslated(context, "Books")!
                      , color: Colors.black,
                      fontWeight: FontWeight.bold, size: 17),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      print(Localizations
                          .localeOf(context)
                          .languageCode);
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
                  const SizedBox(width: 10,)
                ],
              ),
              SizedBox(height: 10,),
              const PopularBooksList(),

            ],
          ),
        ),
      ),
    );
  }
}
