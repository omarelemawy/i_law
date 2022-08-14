import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../localization/localization_constants.dart';
import '../../constants/color_constans.dart';
import '../../constants/themes.dart';

Widget orderItem(context) {
  /* String? getStatus(){
      String? status;
      switch(ordersListData[index].status){
        case 0:
          status =getTranslated(context, "Packing");
          break;
        case 1:
          status =getTranslated(context, "Shipping");
          break;
        case 2:
          status =getTranslated(context, "Arriving");
          break;
        case 3:
          status =getTranslated(context, "success");
          break;
        case 4:
          status =getTranslated(context, "cancel");
          break;

      }
      return status;

    }*/
  return GestureDetector(
    onTap: () {
      /* Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                OrderDetailsScreen(
                ordersListData[index]
            )));*/
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: HexColor("#EBF0FF"))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
              "${getTranslated(context, "Order Number:")}   ${15}",
              fontWeight: FontWeight.bold),
          SizedBox(height: 10,),

          customText("Order at E-comm ",
              color: HexColor("9098B1"),
              size: 12),
          SizedBox(height: 10,),
          Row(
            children: List.generate(150 ~/ 1.5, (index) =>
                Expanded(
                  child: Container(
                    color: index % 2 == 0 ? Colors.transparent
                        : HexColor("#EBF0FF"),
                    height: 2,
                  ),
                )),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              customText(
                  getTranslated(context, "Order Status")!
                  , color: customTextColor.withOpacity(.5)),
              Spacer(),

              customText(
                  "kgkgkgkgy",
                  color: customTextColor),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              customText(getTranslated(context, "Items")!
                  , color: customTextColor.withOpacity(.5)),
              Spacer(),
              customText((10).toString(), color: customTextColor),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              customText(
                  getTranslated(context, "Price")!,
                  color: customTextColor.withOpacity(.5)),
              Spacer(),
              customText("UED ${
                  int.parse("12")-
                      int.parse("14")
              }", color: HexColor("#40BFFF"),
                  fontWeight: FontWeight.bold),
            ],
          )
        ],
      ),
    ),
  );
}
