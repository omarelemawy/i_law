import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_category.dart';

class FeaturedBooksList extends StatelessWidget {

  FeaturedBooksList(

      /*this.myContext,
      this.categoryList,
      this.lang,
      this.phone,*/
      {
    Key? key,
  }) : super(key: key);

  /*var myContext;
  String? lang;
  List<Category> categoryList;
  String phone;*/
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 140,
          child: categoresGridView(/*categoryList, context*/),
    );
  }

  categoresGridView(/*List<Category> list, BuildContext context*/)
  {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return FeaturedBooksCard(/*myContext,lang,phone,list: list, index: index,*/);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },);
  }
}
