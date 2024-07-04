import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/notes_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/note_item.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);
  final NotesController notesController = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
            title: Text("الملاحظات",
                style: UITextStyle.titleBold.copyWith(fontSize: 20))),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder(
              init: notesController,
              builder: (context) {
                return notesController.loading.value == true
                    ? SizedBox(
                  height: Get.height - 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeworkShimmer();
                    },
                  ),
                )
                    : RefreshIndicator(
                  onRefresh: () async {
                    notesController.getNotes();
                  },
                  child: notesController.notes.isEmpty
                      ? SizedBox(
                    height: Get.height - 200,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            "لايوجد ملاحظات!",
                            style: UITextStyle.titleBold.copyWith(
                                fontSize: 16,
                                color: UIColors.lightBlack),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                      : SizedBox(
                    height: Get.height - 170,
                    child: ListView.builder(
                      itemCount: notesController.notes.length,
                      itemBuilder: (context, i) {
                        return NoteItem(
                          note: notesController.notes[i],
                        );
                      },
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
