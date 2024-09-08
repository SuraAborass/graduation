import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Constants/get_routes.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/Out/about_us_item.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/Out/adverts_item.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/Out/teachers_item.dart';



class OutHomeScreen extends StatelessWidget {
  const OutHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
       // drawer:  InstituteDrawer(),
       // bottomNavigationBar: const InstituteBottomNavigationBar(),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  alignment: Alignment.center,
                  child: Text("أهلاً بك!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                    textAlign: TextAlign.center,),
                ),
                const SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      child: Text("إدارة معهد النجاح تتمنى لجميع الطلاب أعواماً من التفوق والإبداع إذا كنت طالباً مسجلاً لدينا سجل دخول إلى حسابك",
                        style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                        textAlign: TextAlign.center,
                        softWrap: true,),
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("من هنا",
                            style: UITextStyle.titleBold.copyWith(color: UIColors.primary),),
                       const SizedBox(width: 10,),
                          Icon(Icons.login,color: UIColors.primary,size: 30,)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height-360,
                      child: GridView(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 0),
                        children: const [
                          TeachersItem(),
                          AdvertsItem(),
                          AboutUsItem()
                        ],
                      ),
                    ),
                   // const SizedBox(height: 20,),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: Get.width,
                  child: MaterialButton(
                    height: 50,
                    minWidth: Get.width,
                    color: UIColors.studentTime,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('طلب تسجيل طالب في المعهد', style: UITextStyle.titleBold),
                      ],
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.registration);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
