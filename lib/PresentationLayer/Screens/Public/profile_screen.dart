import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Public/text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.primary,
        appBar: instituteAppBar(
            title: Text("الملف الشخصي",
                style: UITextStyle.titleBold.copyWith(fontSize: 22))),
        drawer:  InstituteDrawer(),
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Stack(children: [
                                const CircleAvatar(
                                  backgroundColor: UIColors.circleAvatarBorder,
                                  minRadius: 52,
                                  child: CircleAvatar(
                                      backgroundColor:
                                      UIColors.circleAvatarBackground,
                                      minRadius: 50,
                                      backgroundImage: AssetImage(
                                        'assets/images/studentschool.png',
                                      )
                                      // profileController
                                      //     .isProfilePicPathSet.value ==
                                      //     true
                                      //     ? FileImage(File(profileController
                                      //     .profilePicPath
                                      //     .value)) as ImageProvider
                                      //     : CachedNetworkImageProvider(MyApp
                                      //     .appUser!.students[0].image)
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                bottomSheet(context));
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_sharp,
                                        size: 30,
                                        color: UIColors.white,
                                      )),
                                )
                              ]),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 1,
                              child: Text("سرى خالد أبوراس",
                                //MyApp.appUser!.name,
                                style: UITextStyle.titleBold
                                    .copyWith(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Expanded(
                      flex: 7,
                      child: Form(
                        child: Column(
                          children: [
                           const Expanded(
                              flex: 10,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                     InstituteTextFormField(
                                      hintText: 'اسم المستخدم',
                                    ),
                                     SizedBox(
                                      height: 10,
                                    ),
                                    InstituteTextFormField(
                                      hintText: 'رقم الهاتف',
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InstituteTextFormField(
                                      hintText: 'العنوان',
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InstituteTextFormField(
                                      hintText: 'تغيير كلمة المرور',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: Get.width,
                                child: ElevatedButton(
                                    onPressed: ()  {
                                      //await profileController.updateInfo();
                                    },
                                    style: profileButtonStyle,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        //if (profileController.loading.value)
                                        //   const CircularProgressIndicator(
                                        //     color: UIColors.white,
                                        //   ),
                                        Text(
                                          'تحديث معلوماتك',
                                          style: UITextStyle.titleBold
                                              .copyWith(fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      color: UIColors.primary,
      height: 120,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "تعيين صورة الملف الشخصي",
              style: UITextStyle.titleBold,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: ListTile(
                    title: InkWell(
                        onTap: () {
                          //profileController.takePhoto(ImageSource.camera);
                        },
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: UIColors.white,
                          size: 40,
                        )),
                    subtitle: const Text(
                      "Camera",
                      style: UITextStyle.titleBold,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    title: InkWell(
                        onTap: () {
                          //profileController.takePhoto(ImageSource.gallery);
                        },
                        child: const Icon(
                          Icons.image,
                          color: UIColors.white,
                          size: 40,
                        )),
                    subtitle: const Text(
                      "Gallery",
                      style: UITextStyle.titleBold,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

