import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:banking_app/presentation/auth/register/sign_up_page.dart';
import 'package:banking_app/presentation/main/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MainPage();
            } else {
              return Scaffold(
            backgroundColor: AppColors.blueLightColors,
                body: SingleChildScrollView(
                  child: Container(
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.blueColors, AppColors.blueLightColors],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100.h,),
                          Text("Welcome Back", style: AppStyle.poppins28xW400White,),
                          Text("Sign In continue managing you finances", style: AppStyle.poppins14xW400White,),
                          SizedBox(height: 100.h,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please enter your email';
                              }
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide( color: AppColors.white)
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter your password';
                              }
                            },
                            controller: password,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide( color: AppColors.white)
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (email.text.isNotEmpty &&
                                  password.text.isNotEmpty) {
                                context.read<LoginBloc>().add(SignInEvent(
                                    password: password.text,
                                    email: email.text)
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "The information is incomplete",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blueColors,
                                minimumSize: const Size(double.infinity, 55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.r),
                                )),
                            child: Text("Sign In", style: AppStyle.poppins14xW500White),
                          ),
                          SizedBox(height: 16.h,),
                          Center(
                              child: TextButton(
                                  onPressed: () {
                                  },
                                  child: Text(
                                    'Forgot password',
                                    style: AppStyle.poppins14xW500White,
                                  ))),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<LoginBloc>().add(SignInWithGoogleEvent());
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                    backgroundColor:Colors.red[50],
                                    fixedSize: const Size(116, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50))),
                                child: Text(
                                  "Google",
                                  style: AppStyle.poppins14xW400Black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24,),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Create An Account ? ",
                                style: AppStyle.poppins14xW500White,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Sign up',
                                    style: AppStyle.poppins18xW500Red,
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Navigator.pushNamed(context, RoutesName.signup);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

