import 'package:flutter/material.dart';
import 'package:i_law/localization/localization_constants.dart';

import '../books/card_books_vertical.dart';

class FeaturedBooksScreen extends StatefulWidget {
  const FeaturedBooksScreen({Key? key}) : super(key: key);

  @override
  _FeaturedBooksScreenState createState() => _FeaturedBooksScreenState();
}

class _FeaturedBooksScreenState extends State<FeaturedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            getTranslated(context, "Featured Books")!
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
