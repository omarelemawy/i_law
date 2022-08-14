import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import '../my_library/orders_list_screen.dart';

class TotalScreen extends StatefulWidget {
  const TotalScreen({Key? key}) : super(key: key);

  @override
  _TotalScreenState createState() => _TotalScreenState();
}

class _TotalScreenState extends State<TotalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: customText(
            "Total",
            color: customTextColor, fontWeight: FontWeight.bold),
        centerTitle: false,
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CartItem(index),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2
              ),
              SizedBox(height: 20,),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: HexColor("#EBF0FF"))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          customText(
                              getTranslated(context, "Items",)!
                              ,color: HexColor("#9098B1"),
                              size: 12),
                          customText(
                              " 6"
                              ,color: HexColor("#9098B1"),
                              size: 12),
                          const Spacer(),
                          customText(
                              "UED ${427}"
                              ,color: customTextColor,
                              size: 12),
                        ],
                      ),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          customText(getTranslated(context, "Shipping",)!
                              ,color: HexColor("#9098B1"),
                              size: 12),
                          const Spacer(),
                          customText("\$41.86",color: customTextColor,
                              size: 12),
                        ],
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          customText(
                              getTranslated(context, "Discount",)!

                              ,color: HexColor("#9098B1"),
                              size: 12),
                          const Spacer(),
                          customText(
                              "UED ${102}"
                              ,color: customTextColor,
                              size: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          customText(
                              "Shiping"

                              ,color: HexColor("#9098B1"),
                              size: 12),
                          const Spacer(),
                          customText(
                              "UED ${102}"
                              ,color: customTextColor,
                              size: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: List.generate(150~/1.5, (index) => Expanded(
                        child: Container(
                          color: index%2==0?Colors.transparent
                              :HexColor("#EBF0FF"),
                          height: 3,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          customText(
                              getTranslated(context,  "Total Price",)!
                              ,color:customTextColor,
                              size: 12),
                          const Spacer(),
                          customText(
                              "UED ${
                                  042
                              }"
                              ,color: HexColor("#40BFFF"),
                              size: 12),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  customText(
                      getTranslated(context, "Shiping To ")!

                      ,color: Colors.black,
                      size: 14),
                ],
              ),
              SizedBox(height: 10,),
              shipView(1)



            ],
          ),
        ),
      ),
      floatingActionButton:customFloatingActionButton(context,
          text:getTranslated(context, "Pay")
          , onPress: () {

          }),
    );
  }
  Widget shipView(int  index) {
    return GestureDetector(

      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: HexColor("#9098B1").withOpacity(.01),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: HexColor("#9098B1").withOpacity(.2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText("erhrhnnn", fontWeight: FontWeight.bold),
            const SizedBox(
              height: 10,
            ),
            customText(
                "tcdyfdxtcdft",
                color: HexColor("9098B1"),
                size: 12),
            const SizedBox(
              height: 10,
            ),
            customText("cgtrdudifo76r5iyt", size: 12, color: HexColor("#9098B1")),
            const SizedBox(
              height: 10,
            ),
            customText("utgyfytdtsrre", size: 12, color: HexColor("#9098B1")),
            const SizedBox(
              height: 10,
            ),
            /*Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>EditAddressScreen(
                      Localizations.localeOf(context).languageCode,

                      withFloatingActionButton: widget.withFloatingActionButton,
                    )));
                  },
                  color: HexColor("#50555C"),
                  child: customText(
                      getTranslated(context,  "Edit",)!,
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      */
            /* showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return deleteDialog();
                            });*//*
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: HexColor("#50555C").withOpacity(.5),
                    ))
              ],
            )*/
          ],
        ),
      ),
    );
  }
}




class CartItem extends StatefulWidget {
  CartItem(this.index,{Key? key}) : super(key: key);

  int index;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#EBF0FF")),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${getTranslated(context, "Items")} 3",style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
                ),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(getTranslated(context, "Title")!,style: TextStyle(
                        color: Colors.black,
                        fontSize: 17
                    ),),
                    const SizedBox(width: 15,),
                    Expanded(
                      flex: 6,
                      child:  ExpandableText(
                        "fifoyy8ofyoyoy",
                        expandText: getTranslated(context, 'show more')!,
                        collapseText: getTranslated(context, 'show less')!,
                        expandOnTextTap: true,
                        maxLines: 2,
                        style: const TextStyle(
                            color: customTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        linkColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const SizedBox(width: 15,),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child:
                      Text("10 x 3",
                        maxLines: 1,
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#40BFFF"),
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                    Text(
                      "${100} UED",
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: HexColor("#9098B1"),
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double getOffer(String offer, String price) {
    return ((int.parse(price) - int.parse(offer)) /
        int.parse(price)) * 100;
  }
}