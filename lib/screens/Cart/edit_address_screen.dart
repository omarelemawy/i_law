import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import '../../sharedPreferences.dart';

class EditAddressScreen extends StatefulWidget {
   EditAddressScreen(this.lang,{Key? key,this.withFloatingActionButton}) : super(key: key);
  String? lang;
   bool? withFloatingActionButton=true;

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
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
    return Scaffold(
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
                      labelText: getTranslated(context,"Street Address2 (Optional)",)!
                      ,
                      contentPadding: const EdgeInsets.all(10),
                      border:  const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getTranslated(context,"Please Enter Street Address2.",)!
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
                const SizedBox(height: 15),


                customText(
                    getTranslated(context,"City",)!
                    ,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 10),

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



                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
