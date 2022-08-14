import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/screens/Cart/add_address_screen.dart';
import 'package:i_law/screens/Cart/total_screen.dart';
import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import 'edit_address_screen.dart';

class ShipToScreen extends StatefulWidget {
   ShipToScreen(this.lang,{Key? key,this.withFloatingActionButton})
       : super(key: key);
  bool? withFloatingActionButton=true;
  String? lang;
  @override
  _ShipToScreenState createState() => _ShipToScreenState();
}

class _ShipToScreenState extends State<ShipToScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {


   /* Widget deleteDialog(id)
    {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height:
                MediaQuery.of(context).size.height /
                    4,
              ),

              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#FB7181").withOpacity(.2),
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Icon(
                  Icons.error,
                  color: HexColor("#FB7181"),
                  size: 50,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              customText(
                  getTranslated(context,  "Confirmation",)!
                  ,
                  fontWeight: FontWeight.bold, size: 18),
              const SizedBox(
                height: 10,
              ),
              customText(
                  getTranslated(context,  "Are you sure wanna delete address",)!,
                  color: customTextColor.withOpacity(.3),
                  fontWeight: FontWeight.bold,
                  size: 12),
              const SizedBox(
                height: 15,
              ),
              state is DeleteLoadingAddressState?
              const Center(
                child: SpinKitChasingDots(
                  color: customColor,
                  size: 40,
                ),
              ):
              Material(
                elevation: 5,
                child: Container(
                  width:
                  MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor("#087DA9"),
                      border: Border.all(
                          color: customTextColor
                              .withOpacity(.2)),
                      borderRadius:
                      BorderRadius.circular(4)),
                  child:
                  MaterialButton(
                    onPressed: () {
                      MySharedPreferences().getUserId().then((value) {
                        AddressCubit.get(context).deleteAddress(context,
                            id,value,widget.withFloatingActionButton);
                      });
                    },
                    child: customText(
                        getTranslated(context,  "Delete",)!,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: customTextColor
                            .withOpacity(.2)),
                    borderRadius:
                    BorderRadius.circular(4)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: customText(
                      getTranslated(context,  "Cancel",)!
                      ,
                      color:
                      customTextColor.withOpacity(.5),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
    }*/

    Widget shipItem(int  index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selected = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: selected == index
                      ? HexColor("#40BFFF").withOpacity(.05)
                      : HexColor("#9098B1").withOpacity(.01),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: selected == index
                      ? HexColor("#40BFFF")
                      : HexColor("#9098B1").withOpacity(.2))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText("Home", fontWeight: FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "Egypt, Cairo",
                  color: HexColor("9098B1"),
                  size: 12),
              const SizedBox(
                height: 10,
              ),
              customText("12 Mohamed Mahmoud st.", size: 12, color: HexColor("#9098B1")),
              const SizedBox(
                height: 10,
              ),
              customText("01000000000000000", size: 12, color: HexColor("#9098B1")),
              const SizedBox(
                height: 10,
              ),
              Row(
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
                       /* showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return deleteDialog();
                            });*/
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: HexColor("#50555C").withOpacity(.5),
                      ))
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButton:

      customFloatingActionButton(context, onPress: () {

        Navigator.push(context, MaterialPageRoute
          (builder: (context)=>TotalScreen()));

        /*widget.orderData=OrderData(
            orderId: widget.orderData!.orderId,
            orderAmount: widget.orderData!.orderAmount,
            orderDescription: widget.orderData!.orderDescription,
            currencyCode: "AED",
            country: "ARE",
            state: addressList[selected].city!.name,
            address: Address(
                address: addressList[selected].address
            ),
            customColor: "",
            customerUniqueReference: ""
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
                SelectPaymentScreen(
                  orderData: widget.orderData,
                  addressId: addressList[selected].id,
                )));*/
      }, text:
      getTranslated(context,  "Next",)!),

      appBar: AppBar(
        leading: IconButton(
            onPressed: () {

              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor("#9098B1"),
              size: 15,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        title: customText(
            getTranslated(context,  "Ship To",)!,
            color: customTextColor, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>AddAddressScreen("c")));
              },
              icon: Icon(
                Icons.add,
                color: HexColor("#40BFFF"),
              ))
        ],
      ),
      body:
      Padding(
        padding:
        const EdgeInsets.only(top: 8.0, bottom: 80, left: 10, right: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return shipItem(index);
          },
          itemCount: 10,
        ),
      ),
    );



  }
}
