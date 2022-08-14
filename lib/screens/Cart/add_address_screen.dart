
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import '../../sharedPreferences.dart';

class AddAddressScreen extends StatefulWidget {
   AddAddressScreen(this.lang,
       {Key? key,this.withFloatingActionButton}) : super(key: key);
   bool? withFloatingActionButton=true;
  String? lang;

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCountry;
  int? selectedCountryId;
  int? selectedCity;
  int? selectedRegion;

  TextEditingController addressEditingController=TextEditingController();

  TextEditingController postalCodeEditingController=TextEditingController();
  TextEditingController phoneEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:
        Icon(Icons.arrow_back_ios,size: 14,color: HexColor("#9098B1"),)),
        title: customText(
            getTranslated(context,"Add Address",)!
            ,fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),

      floatingActionButton:
      customFloatingActionButton(context,onPress: (){
        if (_formKey.currentState!.validate()) {
          MySharedPreferences().getUserId().then((value) {

          });
        }
      },text:
      getTranslated(context,"Save Address",)!
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                    getTranslated(context,"Country or region",)!
                    ,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 10),

                TextFormField(
                  controller: addressEditingController,
                  decoration:  InputDecoration(
                      labelText: getTranslated(context,"Street Address",)!
                      ,
                      labelStyle:  const TextStyle(fontSize: 12),
                      contentPadding:  const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Street Address.",)!
                      ;
                    }
                    return null;
                  },
                ),


                /*  const SizedBox(height: 15),

                TextFormField(
                 decoration:  InputDecoration(
                     labelStyle:  const TextStyle(fontSize: 12),
                   labelText: getTranslated(context,"First Name",)!,
                   contentPadding:  const EdgeInsets.all(10),
                   border:  const OutlineInputBorder()
                 ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter First Name",)!;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                TextFormField(
                  decoration:  InputDecoration(
                      labelStyle:  const TextStyle(fontSize: 12),
                      labelText: getTranslated(context,"Last Name",)!
                      ,
                      contentPadding: const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Last Name.",)!;
                    }
                    return null;
                  },
                ),*/

                const SizedBox(height: 15),
                TextFormField(
                  controller: addressEditingController,
                  decoration:  InputDecoration(
                      labelText: getTranslated(context,"Street Address",)!
                      ,
                      labelStyle:  const TextStyle(fontSize: 12),
                      contentPadding:  const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Street Address.",)!
                      ;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: postalCodeEditingController,
                  decoration:  InputDecoration(
                      labelStyle:  const TextStyle(fontSize: 12),
                      labelText: getTranslated(context,"Postal Code",)!
                      ,
                      contentPadding: const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Postal Code.",)!
                      ;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneEditingController,
                  decoration:  InputDecoration(
                      labelStyle:  const TextStyle(fontSize: 12),
                      labelText: getTranslated(context, "Phone Number",)!
                      ,
                      contentPadding: const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context, "Please Enter Street Address2.",)!
                      ;
                    }
                    return null;
                  },
                ),
                customText(
                    getTranslated(context, "State/Province/Region",)!
                    ,fontWeight: FontWeight.w600),
                const SizedBox(height: 10),

                TextFormField(
                  controller: addressEditingController,
                  decoration:  InputDecoration(
                      labelText: getTranslated(context,"Street Address",)!
                      ,
                      labelStyle:  const TextStyle(fontSize: 12),
                      contentPadding:  const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Street Address.",)!
                      ;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),


                customText(
                    getTranslated(context,"City",)!
                    ,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 10),

                TextFormField(
                  controller: addressEditingController,
                  decoration:  InputDecoration(
                      labelText: getTranslated(context,"Street Address",)!
                      ,
                      labelStyle:  const TextStyle(fontSize: 12),
                      contentPadding:  const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Street Address.",)!
                      ;
                    }
                    return null;
                  },
                ),



                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
