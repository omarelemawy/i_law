import 'package:flutter/material.dart';

import '../books/books_list_vertical.dart';
import '../books/card_books_vertical.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
           "jboebhio"
         ),
         backgroundColor: Colors.white,
         elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.separated(
          itemCount: 10,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return CardBooksVertical(/*myContext,lang,phone,list: list, index: index,*/);
          },
          separatorBuilder: (BuildContext context, int index) {
            return  Container(height:.3,color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 30),);
          },),
      ),
    );
  }
}
