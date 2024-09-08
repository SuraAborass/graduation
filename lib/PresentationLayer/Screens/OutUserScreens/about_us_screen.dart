import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/fees_item.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/genaral_info_item.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/resolves_item.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(
          title: Text(
            "حول المعهد",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10),
            children: [
              FeesItem(),
              ResolvesItem(),
              GeneralInfoItem(),
            ],
          ),
        ),
      ),
    );
  }
}
