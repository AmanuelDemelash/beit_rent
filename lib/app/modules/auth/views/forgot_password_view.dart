import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../utils/validation.dart';

class ForgotPasswordView extends GetView {
   ForgotPasswordView({super.key});
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Get.back(), icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body:Stack(children: [
          Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/buildings_pic.png")),
         Container(width: Get.width,height: Get.height,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Phone number",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(Validation.phoneNumberValidation(value!)){
                  }else{
                    return "invalid phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: "9********",
                    prefixIcon:CountryCodePicker(
                      onChanged: print,
                      initialSelection: 'ET',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ) ,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width:2))
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Checkbox.adaptive(value:true, onChanged:(value) {},checkColor: Colors.white,activeColor: Colors.black,),
                  const Text("Reset customer Account")
                ],
              ),
              //reset button
              Container(
                margin: const EdgeInsets.only(top: 30,bottom:20),
                width: Get.width,
                child: ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("Next",style: TextStyle(color: Colors.white),)),
              )
            ],
          ))

        )

      ])
    );
  }
}
