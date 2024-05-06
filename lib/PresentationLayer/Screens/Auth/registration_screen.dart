import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/PresentationLayer/Widgets/Public/text_form_field.dart';

import '../../../BusinessLayer/Controllers/registration_order_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../Widgets/Public/AppBar.dart';

class RegistrationOrderScreen extends StatefulWidget {
   RegistrationOrderScreen({super.key});

  @override
  State<RegistrationOrderScreen> createState() => _RegistrationOrderScreenState();
}

class _RegistrationOrderScreenState extends State<RegistrationOrderScreen> {
   String dropDownValue = 'الصف التاسع 1000000';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: mainAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
               const InstituteTextFormField(
                  hintText: 'اسم الطالب',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'اسم الأب',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'اسم الأم',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'عمل الأب (اختياري)',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'عمل الأم (اختياري)',
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: gradeButtonStyle,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                            'اختر الصف',
                        style: UITextStyle.normalSmall,
                      ),
                       const SizedBox(width: 170,),
                      IconButton(onPressed: () async{
                        await showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(context));
                      },
                          icon: const Icon(Icons.arrow_drop_down_outlined))

                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'تاريخ الولادة',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'رقم هاتف للتواصل',
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    height: 56,
                    minWidth: Get.width,
                    color: UIColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text('حفظ', style: UITextStyle.titleBold)
                      ],
                    ),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 250,
      decoration: const BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "الصفوف",
                    style: UITextStyle.titleBold
                        .copyWith(color: UIColors.black),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text("الأقساط",
                      style: UITextStyle.titleBold
                          .copyWith(color: UIColors.black)),
                ],
              ),
              Expanded(
                child: DropdownButton<String>(
                    value: dropDownValue,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                          value:"الصف التاسع 1000000",
                          child: Text("الصف التاسع 1000000")),
                      DropdownMenuItem<String>(
                          value:"الثالث الثانوي العلمي 2000000",
                          child: Text("الثالث الثانوي العلمي 1000000")),
                      DropdownMenuItem<String>(
                          value:"الثالث الثانوي الأدبي 2000000",
                          child: Text("الثالث الثانوي الأدبي 1000000")),
                    ],
                    onChanged: (String? newValue){
                      setState((){
                        dropDownValue = newValue!;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
