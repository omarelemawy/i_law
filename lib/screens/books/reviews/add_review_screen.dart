import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/MediaButton.dart';
import '../../../constants/color_constans.dart';
import '../../../constants/themes.dart';
import '../../../localization/localization_constants.dart';

class AddReviewScreen extends StatefulWidget {
   AddReviewScreen({Key? key}) : super(key: key);

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  double? rate = 3.6;
  TextEditingController commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 14,
            )),
        title: customText(
            getTranslated(context,  "Write Review",)!

            , fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customText(
                  getTranslated(context,
                    "Please write Overall level of satisfaction with your shipping / Delivery Service",)!
                  ,
                  max: 2,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                        print(rating.toString());
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customText("$rate/5", color: HexColor("#9098B1"))

                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 5,),
                  customText(
                      getTranslated(context, "Write Your Review",)!
                      , fontWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(height: 10,),
              TextFormField(
                maxLines: 5,
                controller: commentController,
                textAlign:TextAlign.start,
                decoration:  InputDecoration(
                    alignLabelWithHint: true,
                    label:  Text(
                      getTranslated(context, "Write your review here",)!
                      ,style: TextStyle(
                        fontSize: 12
                    ),),
                    border:  OutlineInputBorder(
                    )
                ),
              ),
              SizedBox(height: 40,),

              customButton((){


              }
                  , context,
                  getTranslated(context, "Review",)!

                  ,width: MediaQuery.of(context).size.width
              )
            ],
          ),
        ),
      ),
    );
  }
}
