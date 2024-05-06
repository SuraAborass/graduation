import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../../main.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/screens_widgets/homeworks_item.dart';
import '../../Widgets/screens_widgets/subjects_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14.0),
          child: SizedBox(
            child: GridView(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 0),
              children: const [
                SubjectsItem(),
                 HomeWorksItem(),
                // VacationsItem(),
                // ResultsItem(),
                // StudentTimeItem(),
                // BusItem(),
                // AlertsItem(),
                // InstallmentsItem(),
                // ComplaintsItem(),
                // TeacherNotesItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
