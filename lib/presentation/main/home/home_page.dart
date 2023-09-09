import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/app_images.dart';
import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/home/bloc/home_bloc.dart';
import 'package:banking_app/presentation/main/home/widgets/drawer_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: Drawers(),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: (){
                    _scaffoldKey.currentState!.openDrawer();
                  },
                    child: Icon(Icons.menu)),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Icon(Icons.add_alert_outlined),
                  )],
                expandedHeight: 300.h,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: Stack(

                    children: [
                      Container(
                        child: Image.asset(AppImages.landImage, fit: BoxFit.cover,),
                        height: 400.h,
                      ),
                      Positioned(
                        top: 180.w,
                        left: 48.w,
                        child:  Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(24.w),
                                side: BorderSide(color: AppColors.white, width: 1),
                                backgroundColor: Colors.white24
                              ),
                              child: Icon(Icons.add),
                              onPressed: () {
                                Navigator.pushNamed(context, RoutesName.addCard);
                              },
                            ),
                            SizedBox(height: 12.h,),
                            Text("Add Card".tr(), style: AppStyle.poppins14xW500White,)
                          ],
                        ),
                      ),

                      Positioned(
                        top: 180.w,
                        left: 144.w,
                        child:  Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.all(24.w),
                                  side: BorderSide(color: AppColors.white, width: 1),
                                  backgroundColor: Colors.white24
                              ),
                              child: Icon(Icons.credit_card),
                              onPressed: () {
                                Navigator.pushNamed(context, RoutesName.myCards);
                              },
                            ),
                            SizedBox(height: 12.h,),
                            Text("My Cards".tr(), style: AppStyle.poppins14xW500White,)
                          ],
                        ),
                      ),
                      Positioned(
                        top: 180.w,
                        left: 240.w,
                        child:  Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.all(24.w),
                                  side: BorderSide(color: AppColors.white, width: 1),
                                  backgroundColor: Colors.white24
                              ),
                              child: Icon(Icons.qr_code),
                              onPressed: () {},
                            ),
                            SizedBox(height: 12.h,),
                          Text("QR Pay".tr(), style: AppStyle.poppins14xW500White,)
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
                  child: ClipRRect(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        labelText: "Search for services...", labelStyle: AppStyle.poppins14xW400Black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r)),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text("Transfers", style: AppStyle.poppins16xW400Black,),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r), // <-- Radius
                          ),
                          padding: EdgeInsets.all(18.w),
                          backgroundColor:  AppColors.blueColors,
                        ),
                        child: Text("Transfers funds", style: AppStyle.poppins14xW500White,),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.all(18.w),
                          backgroundColor: AppColors.blueColors,
                        ),
                        child: Text("Request money", style: AppStyle.poppins14xW500White,),
                        onPressed: () {},
                      ),
                    ],
                  )
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Saved Payments", style: AppStyle.poppins16xW400Black,),
                        Spacer(),
                        TextButton(onPressed: (){}, child:  Text("More",style: AppStyle.poppins16xW400Black,)),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                  child: SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),

                          ),
                          width: 100.w,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            color: Color(0xFFB2EBF2),
                            child: Center(child: Text('Beeline $index')),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
