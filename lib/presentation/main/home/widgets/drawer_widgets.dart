import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/app_icon.dart';
import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 48.w, horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.blueColors
                ),
                child: ListTile(
                  title: Text("Shoxrux Madiyorov", style: AppStyle.poppins16xW400Black,),
                  subtitle: Text("+998909211131", style: AppStyle.poppins16xW400Black,),
                  trailing: SvgPicture.asset(AppIcons.arrowIcon),
                  onTap: (){},
                ),
              ),
            ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title:  Text(
            "Settings",
            style: AppStyle.poppins16xW400Black
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.image),
          title:  Text(
              "Themes",
              style: AppStyle.poppins16xW400Black
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.share),
          title:  Text(
              "Share",
              style: AppStyle.poppins16xW400Black
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.support_agent_outlined),
          title:  Text(
              "Support",
              style: AppStyle.poppins16xW400Black
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.language_outlined),
          title:  Text(
              "Language",
              style: AppStyle.poppins16xW400Black
          ),
          onTap: (){
            Navigator.pushNamed(context, RoutesName.language);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
           "Close",
            style: AppStyle.poppins16xW400Black
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
