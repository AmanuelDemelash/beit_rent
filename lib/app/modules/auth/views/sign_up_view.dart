import 'package:beit_rent/app/modules/auth/controllers/auth_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../utils/validation.dart';

class SignUpView extends GetView<AuthController> {
   SignUpView({super.key});
   final PageController _pageController=PageController(initialPage: 0);
   final _formKey=GlobalKey<FormState>();
   final _formKeyPassword=GlobalKey<FormState>();
   final TextEditingController _phoneController=TextEditingController();
   final TextEditingController _nameController=TextEditingController();
   final TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          if(_pageController.page==0){
            Get.back();
          }else{
            _pageController.jumpToPage(0);
          }

        }, icon:const FaIcon(FontAwesomeIcons.arrowLeft)),
      ),
      body: Stack(children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/buildings_pic.png")),
        Container(width: Get.width,height: Get.height,
            padding: const EdgeInsets.all(20),
            child:PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Form(
                    key: _formKey,
                    child: ListView(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 100,
                                    bottom: 30
                                ),
                                child: const Text("Create Account",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),)),
                            const Text("Name",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: _nameController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if(Validation.validateName(value!)){
                                }else{
                                  return "invalid name";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                  hintText: "Aman Root",
                                  prefixIcon:Padding(
                                    padding: EdgeInsets.only(left: 10,top: 15),
                                    child: FaIcon(FontAwesomeIcons.solidUser,size: 17,),
                                  ) ,
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width:2))
                              ),
                            ),
                            const SizedBox(height: 10,),
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
                            const Text("Email",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: _emailController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if(Validation.validateEmail(value!)){
                                }else{
                                  return "invalid email";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                  hintText: "example@gmail.com",
                                  prefixIcon:Padding(
                                    padding: EdgeInsets.only(left: 10,top: 15),
                                    child: FaIcon(FontAwesomeIcons.solidEnvelope,size: 17,),
                                  ) ,
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width:2))
                              ),
                            ),
                            //next button
                            Container(
                              margin: const EdgeInsets.only(top: 30,bottom:20),
                              width: Get.width,
                              child: ElevatedButton(onPressed: () {
                                _formKey.currentState!.save();
                                if(_formKey.currentState!.validate()){
                                  _pageController.jumpToPage(1);
                                }
                              },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                  ),
                                  child: const Text("Next",style: TextStyle(color: Colors.white),)),
                            )
                          ],
                        ),
                ),
                Form(
                  key: _formKeyPassword,
                    child:  ListView(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            top: 100,
                            bottom: 30
                        ),
                        child: const Text("Create Password",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),)),
                    const Text("Password",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
                    const Text("Password",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.only(top: 30,bottom:20),
                      width: Get.width,
                      child: ElevatedButton(onPressed: () {
                        _formKey.currentState!.save();
                        if(_formKey.currentState!.validate()){
                        }
                      },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text("Submit",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ))
              ],
            )


        )

      ])
    );
  }
}
