import 'package:flutter/material.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/categories/sub_category_list.dart';

import '../../constants/widget.dart';

class AllCategoryList extends StatefulWidget {
  const AllCategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<AllCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:
            (){
              Navigator.pop(context);
             }
            , icon:Icon(Icons.arrow_back_ios,
              color: Colors.black,size: 25
              ,)),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getTranslated(context, "Categories")!,style: TextStyle(
              fontSize: 34,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    itemBuilder:
                        (context,index){
                         return InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder:
                             (context)=>AllSubCategoryList()));
                           },
                             child: getCategoryCard(context));
                        },
                    separatorBuilder: (context,index){
                      return Container(
                        height: .5,
                        margin: EdgeInsets.only(left: 10),
                        color: Colors.grey,
                      );
                    },
                    itemCount: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget getCategoryCard(context){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        /*Container(
          height: 90,
          width: 90,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration:   BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: customCachedNetworkImage(
            boxFit: BoxFit.cover,
            context: context,
            url: "https://apod.nasa.gov/apod/image/0407/moussette_aur16jul1_full.jpg",
          ),
        ),*/
        SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
          getTranslated(context, "Arts")!
              ,style:
            TextStyle(color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("657 books",style:
            TextStyle(color: Colors.grey,
                fontSize: 15),),
          ],
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,color: Colors.grey,
          size: 18,
        )
      ],
    ),
  );
}