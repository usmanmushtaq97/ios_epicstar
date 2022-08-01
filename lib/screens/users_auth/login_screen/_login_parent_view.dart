import 'package:epicstar/componants/epic_input_feild.dart';
import 'package:epicstar/componants/roundedbuttons.dart';
import 'package:epicstar/componants/text_button.dart';
import 'package:epicstar/core_utils/assets.dart';
import 'package:epicstar/core_utils/colors.dart';
import 'package:epicstar/core_utils/text_view.dart';
import 'package:epicstar/core_utils/toasts.dart';
import 'package:flutter/material.dart';

import '../../../core_utils/res.dart';

class ParentLoginView extends StatefulWidget {
  const ParentLoginView({Key? key}) : super(key: key);

  @override
  State<ParentLoginView> createState() => _ParentLoginViewState();
}

class _ParentLoginViewState extends State<ParentLoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>((false));
  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            automaticallyImplyLeading: true,
            elevation: 1.0,
            leading: IconButton(
              color: AppColors.kWhiteColor,
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 20.0,
              onPressed: () {
                // Navigator.pop(context);
              },
            )),
        body: Container(
          decoration: BoxDecoration(color: AppColors.lightBackgroundColor),
          child: Column(
            children: [
              _loginTopHeader(),
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.whiteTextColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: TextView.getTextWith20("Welcome to EpicStar", Assets.poppinsRegular, color: AppColors.blackTextColor, lines: 1),
                        ),

                        EmailInputField(hint: "Mobile", prefixIcon: const Icon(Icons.phone_android), controller: emailController, label: "Mobile",),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                            valueListenable: obscurePassword,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: passwordController,
                                obscureText: obscurePassword.value,
                               // focusNode: passwordFocusNode,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: const Icon(Icons.lock_clock_outlined),
                                    label: Text("Password", style: TextStyle(color: AppColors.kPrimaryColor),),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          obscurePassword.value = !obscurePassword.value;
                                        },
                                        child: Icon(obscurePassword.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility))),
                              );
                            }),
                      const  SizedBox(height: 35),
                        RoundedButton(title: "Login", loading: false, onPress:(){
                          Toasts.getErrorToast(text: "Server Communication Error");
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: EpicTextButton(onPress: (){
                            Toasts.getErrorToast(text: "Server Communication Error");
                          }, title: 'Forgot Password?',),
                        ),
                        RoundedButton(color:AppColors.greyButtonTextColor, title: "SignUp", loading: false, onPress:(){
                          Toasts.getErrorToast(text: "Server Communication Error");
                        }),
                      ],
                    ),
                ),
              ),
                  ))
            ],
          ),
        ),
      ),
    );
  }




  /// Login top Container  with logo
  /// Type [widget]
  Widget _loginTopHeader(){
    return    Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Image.asset(Assets.appIcon, height: 100, width: 100),
      ),
    );
  }
}
