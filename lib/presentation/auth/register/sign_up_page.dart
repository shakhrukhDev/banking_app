import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/auth/login/login%20_page.dart';
import 'package:banking_app/presentation/auth/register/bloc/signup_bloc.dart';
import 'package:banking_app/presentation/main/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigUpPage extends StatelessWidget {
  SigUpPage({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return StreamBuilder(
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
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100.h,),
                          Text("Register", style: AppStyle.poppins28xW400White,),
                          Text("Register start managing you finances", style: AppStyle.poppins14xW400White,),
                          SizedBox(height: 100.h,),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter yor full name';
                              }
                            },
                            controller: name,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide( color: AppColors.white)
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              hintText: "Full name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ),
                           SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
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
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter yor password';
                              }
                            },
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide( color: AppColors.white)
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blueColors,
                                  minimumSize: const Size(double.infinity, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.r),
                                  )),
                              onPressed: () {
                                context.read<SignupBloc>().add(SignUpEvent(
                                    password: password.text,
                                    email: email.text));
                              },
                              child: Text(
                                'Sign Up',
                                style: AppStyle.poppins14xW500White,
                              )),
                          SizedBox(height: 48.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "I Already Have an Account",
                                style: AppStyle.poppins14xW400White,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, RoutesName.login);
                                },
                                child: Text(
                                  "Log In",
                                  style: AppStyle.poppins18xW500Red,
                                ),
                              ),
                            ],
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
