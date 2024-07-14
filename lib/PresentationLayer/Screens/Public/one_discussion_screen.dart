import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/BusinessLayer/Controllers/discussions_controller.dart';
import 'package:graduation/DataAccessLayer/Models/comment.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
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
                                        // تابع تعديل التعليق
                                        discussionsController.editComment(discussionsController.editCommentId , _commentController.text , onSuccess: (p0) {
                                          discussionsController.getComments(discussionsController.commentsState.result.id);
                                        },);
                                        
                                        setState(() {
                                          editingComment = null;
                                          _commentController.clear();
                                        });

                                      } else {
                                        // تابع إضافة تعليق جديد
                                        discussionsController.addComment(
                                            discussionsController.commentsState.result.id, _commentController.text);
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

  Comment comment;

  DiscussionItem({required this.onEdit, required this.comment});
  DiscussionsController discussionsController = Get.put(DiscussionsController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCommentDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
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
                    Text(
                      "${comment.user.firstName} ${comment.user.lastName}",
                      style: UITextStyle.titleBold.copyWith(fontSize: 16),
                    ),
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
      ),
    );
  }

  void showCommentDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('خيارات التعليق', style: UITextStyle.titleBold.copyWith(color: UIColors.black)),
        content: Text('اختر إجراءً لهذا التعليق', style: UITextStyle.titleNormal.copyWith(color: UIColors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              onEdit('حسب المبدأ الأساسي في العد يوجد 8400 طريقة');
              discussionsController.editCommentId = comment.id;
            },
            child: Text('تعديل', style: TextStyle(color: UIColors.primary)),
          ),
          TextButton(onPressed: () {
            discussionsController.deleteComment(comment.id , onSuccess: (p0) {
              discussionsController.getComments(comment.postID);
            },);
            Get.back();

            //   تابع الحذف
          }, child: Obx(
            () {
              return discussionsController.deleteCommentState.loading
                  ? CircularProgressIndicator()
                  : Text(
                      'حذف',
                      style: TextStyle(color: Colors.red),
                    );
            },
          )),
        ],
      ),
    );
  }
}
