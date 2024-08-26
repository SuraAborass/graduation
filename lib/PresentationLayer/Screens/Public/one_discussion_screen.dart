import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation/BusinessLayer/Controllers/discussions_controller.dart';
import 'package:graduation/DataAccessLayer/Models/comment.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../main.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/institute_appbar.dart';

class OneDiscussionScreen extends StatelessWidget {
  OneDiscussionScreen({super.key});

  final TextEditingController _commentController = TextEditingController();
  String? editingComment;

  DiscussionsController discussionsController = Get.put(DiscussionsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return discussionsController.commentsState.loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: instituteAppBar(
            title: Text(
              discussionsController.commentsState.result.subject.name,
              style: UITextStyle.titleBold.copyWith(fontSize: 25),
            ),
          ),
          drawer: InstituteDrawer(),
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            discussionsController.commentsState.result.quostion,
                            style: UITextStyle.titleBold.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return DiscussionItem(
                            onEdit: (comment) {
                              setState(() {
                                editingComment = comment;
                                _commentController.text = comment;
                              });
                            },
                            comment: discussionsController.commentsState.result.comments[index],
                          );
                        },
                        childCount: discussionsController.commentsState.result.comments.length,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'اكتب تعليق...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                    Obx(() {
                      return discussionsController.addCommentState.loading
                          ? Center(child: CircularProgressIndicator())
                          : IconButton(
                        icon: Icon(Icons.send, color: UIColors.primary),
                        onPressed: () {
                          if (editingComment != null) {
                            discussionsController.editComment(
                              discussionsController.editCommentId,
                              _commentController.text,
                              onSuccess: (p0) {
                                discussionsController.getComments(
                                    discussionsController.commentsState.result.id);
                              },
                            );
                            setState(() {
                              editingComment = null;
                              _commentController.clear();
                            });
                          } else {
                            discussionsController.addComment(
                                discussionsController.commentsState.result.id,
                                _commentController.text);
                            _commentController.clear();
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void setState(Null Function() param0) {}
}

class DiscussionItem extends StatelessWidget {
  final Function(String) onEdit;
  final Comment comment;

  DiscussionItem({required this.onEdit, required this.comment});

  DiscussionsController discussionsController = Get.put(DiscussionsController());

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final userId = storage.read('userId');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/teacher-ph.jpg'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${comment.user.firstName} ${comment.user.lastName}",
                          style: UITextStyle.titleBold.copyWith(fontSize: 16),
                        ),
                      ),
                      if (comment.user.id == MyApp.appUser!.id) // التحقق من أن التعليق لصاحبه
                        PopupMenuButton<String>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: Icon(Icons.more_horiz, color: Colors.white),
                          onSelected: (value) {
                            if (value == 'edit') {
                              showEditCommentDialog(context, comment);
                            } else if (value == 'delete') {
                              discussionsController.deleteComment(
                                comment.id,
                                onSuccess: (p0) {
                                  discussionsController.getComments(comment.postID);
                                },
                              );
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Center(child: Text('تعديل', style: UITextStyle.titleNormal.copyWith(color: UIColors.primary))),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Center(child: Text('حذف', style: UITextStyle.titleNormal.copyWith(color: UIColors.error))),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    comment.description,
                    style: UITextStyle.titleNormal.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showEditCommentDialog(BuildContext context, Comment comment) {
    final TextEditingController _editController = TextEditingController(text: comment.description);

    Get.dialog(
      AlertDialog(
        title: Text('تعديل التعليق', style: UITextStyle.titleBold.copyWith(color: UIColors.black)),
        content: TextField(
          controller: _editController,
          decoration: InputDecoration(
            hintText: 'عدل تعليقك...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('إلغاء', style: UITextStyle.titleNormal.copyWith(color: UIColors.primary)),
          ),
          TextButton(
            onPressed: () {
              onEdit(_editController.text);
              discussionsController.editCommentId = comment.id;
              discussionsController.editComment(
                comment.id,
                _editController.text,
                onSuccess: (p0) {
                  discussionsController.getComments(comment.postID);
                },
              );
              Get.back();
            },
            child: Text('حفظ', style: UITextStyle.titleNormal.copyWith(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
