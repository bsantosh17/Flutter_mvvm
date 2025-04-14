import 'package:flutter/material.dart';
import 'package:flutter_new/core/utils/NetworkUtil.dart';
import 'package:flutter_new/screen/auth/viewmodel/AuthViewModel.dart';
import 'package:flutter_new/widgets/custom_circle_avatar.dart';
import 'package:flutter_new/widgets/custom_text.dart';
import 'package:flutter_new/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/login.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 55, left: 35),
                child: CustomText(text: "Welcome Back",color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22, left: 35),
              child: CustomText(text: "Login",color: Colors.green,fontWeight: FontWeight.bold,fontSize: 35),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 30,right: 30, top: MediaQuery.of(context).size.height * 0.4),
                child: Column(
                  children: [
                    CustomTextField(
                        label: "Email",
                        controller: emailController,
                        hintText: "Enter Email",
                        prefixIcon: Icons.email,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        hintText: 'Enter Password',
                        prefixIcon: Icons.key,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Sign In",
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                        authViewModel.isLoading
                          ?CircularProgressIndicator()
                        :
                         CustomCircleAvatar(
                             icon: Icons.arrow_forward,
                             radius: 30,
                             backgroundColor: Colors.green,
                             iconColor: Colors.white,
                             onPressed: () async {
                              bool isOnline = await NetworkUtil.isConnected();
                              if(!isOnline){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("No internet connection")),
                                );
                                return;
                              }

                               
                               authViewModel.LoginIntegration(context,
                                   emailController.text.toString(),
                               passwordController.text.toString());
                             })
                        ],

                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
