import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/payment/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:  AppColors.blueColors,
            title: Text(
              "Payment",
              style: AppStyle.poppins20xW400White,
            ),
            automaticallyImplyLeading: false,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                  child: ClipRRect(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        labelText: "Search...", labelStyle: AppStyle.poppins14xW400Black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r)),
                      ),
                    ),
                  ),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, ),
                  child: SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
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
                            child: Center(child: Text('No data $index')),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Payments for services", style: AppStyle.poppins16xW400Black,),
                        Spacer(),
                        TextButton(onPressed: (){}, child:  Text("More",style: AppStyle.poppins16xW400Black,)),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, ),
                  child: SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
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
                            child: Center(child: Text('No data $index')),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("My home", style: AppStyle.poppins16xW400Black,),
                        Spacer(),
                        TextButton(onPressed: (){}, child:  Text("More",style: AppStyle.poppins16xW400Black,)),
                      ],
                    )
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, ),
                    child: ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text(
                        "Add Home",
                        style: AppStyle.poppins16xW400Black,
                      ),
                      trailing: Icon(Icons.add),
                      tileColor: Color(0xFFB2EBF2),
                      onTap: () {},
                    ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Payment by Location", style: AppStyle.poppins16xW400Black,),
                        Spacer(),
                        TextButton(onPressed: (){}, child:  Text("More",style: AppStyle.poppins16xW400Black,)),
                      ],
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
