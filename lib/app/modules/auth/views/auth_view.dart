import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:beit_rent/app/routes/app_pages.dart';
import 'package:beit_rent/app/utils/validation.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
   AuthView({super.key});

  final _formKey=GlobalKey<FormState>();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/buildings_pic.png")),
        Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Text("Language",textAlign: TextAlign.right,style: TextStyle(color: ColorConstant.primaryColor,fontWeight: FontWeight.bold,fontSize: 17),),
              Container(
                width: Get.width,
                height: 200,
                margin: const EdgeInsets.all(25),
                  child: Center(child: Image.asset("assets/images/primary.png",fit: BoxFit.fill, width: Get.width/3,))),
              const Text("Sign In",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Expanded(
                child: Form(
                  key: _formKey,
                    child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phone number",style: titleStyle(),),
                    formGap(),
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
                    formGap(),
                    Text("Password",style: titleStyle(),),
                    formGap(),
                    Obx(() =>TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      obscureText:controller.showPassword.value,
                      validator: (value) {
                        if(Validation.validatePassword(value!)){
                        }else{
                          return "invalid phone number";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "********",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(top: 10,left: 15),
                            child: FaIcon(FontAwesomeIcons.lock,size: 18,),
                          ),
                          suffixIcon:IconButton(onPressed: () =>controller.showPassword.value=!controller.showPassword.value, icon:
                           controller.showPassword.value? const FaIcon(FontAwesomeIcons.solidEye,size:15,):const FaIcon(FontAwesomeIcons.solidEyeSlash,size:15,)),
                          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2))
                      ),
                    ),),
                    formGap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Checkbox.adaptive(value:true, onChanged:(value) {},checkColor: Colors.white,activeColor: Colors.black,),
                        const Text("login as a customer")
                      ],
                    ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.FORGOT),
                          child: const Text("Forgot Password?",style: TextStyle(color: ColorConstant.primaryColor,fontWeight: FontWeight.bold),))

                    ],),
                    //login button
                    Container(
                      margin: const EdgeInsets.only(top: 30,bottom:20),
                      width: Get.width,
                      child: ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15)
                          ),
                          child: const Text("Login In",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                )),),
               Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.SIGNUP),
                  child: const Text.rich(TextSpan(children: [
                    TextSpan(text: 'Dont have an account?', style: TextStyle(fontSize: 17)),
                    TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstant.primaryColor, fontSize: 18))
                  ])),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }

  SizedBox formGap() => const SizedBox(height: 10,);

  TextStyle titleStyle() => const TextStyle(fontSize:17,fontWeight: FontWeight.bold);
}
