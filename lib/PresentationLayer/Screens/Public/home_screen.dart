import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/Advertisements_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/notes_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/archive_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/courses_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/homeworks_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/program_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/results_item.dart';
import '../../Widgets/screens_widgets/HomeScreenWidgets/subjects_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
        drawer:  InstituteDrawer(),
        bottomNavigationBar: const InstituteBottomNavigationBar(),
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
                ProgramItem(),
                ResultsItem(),
                ArchiveItem(),
                CoursesItem(),
                NotesItem(),
                AdvertisementsItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
