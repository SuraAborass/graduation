import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Constants/colors.dart';
import 'package:graduation/Constants/text_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class OneAdvert extends StatefulWidget {
  final String id;
  final String courseId;
  final String title;
  final String image;
  final DateTime createdAt;
  final String discription;

  OneAdvert({
    required this.id,
    required this.title,
    required this.discription,
    required this.image,
    required this.createdAt,
    required this.courseId
  });

  @override
  State<OneAdvert> createState() => _OneAdvertState();
}

class _OneAdvertState extends State<OneAdvert> {
  bool isLoading = false;
  final storage = GetStorage();

  Future<void> registerForCourse(String courseId,String token) async {
    setState(() {
      isLoading = true;
    });

    // استبدل "your_api_endpoint" بعنوان الخادم الخاص بك
    final String apiUrl = 'http://192.168.43.99:8000/api/student/create-order-course/${courseId}';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // تم التسجيل بنجاح
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم التسجيل بنجاح')),
        );
      } else {
        // حدث خطأ أثناء التسجيل
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل التسجيل')),
        );
      }
    } catch (e) {
      // معالجة الأخطاء
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 10, 30),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Container(
            width: deviceSize.width / 1.2,
            height: deviceSize.height / 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  UIColors.white.withOpacity(0.7),
                  UIColors.lightBlack.withOpacity(0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// title $ num_students
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                        child: Column(
                          children: [
                            Text(
                              widget.title,
                              style: UITextStyle.smallBodyNormal,
                            ),
                            SizedBox(width: deviceSize.width / 30),
                            Text(
                              'تم النشر ' + widget.createdAt.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///Image
                widget.image != ""
                    ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    widget.image,
                    width: deviceSize.width / 1.5,
                    height: deviceSize.height / 2.5,
                    fit: BoxFit.fill,
                  ),
                )
                    : SizedBox(),

                ///discription
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.discription,
                    style: UITextStyle.titleNormal
                        .copyWith(color: UIColors.primary),
                  ),
                ),
                SizedBox(),
                MaterialButton(
                  height: 56,
                  minWidth: 50,
                  color: UIColors.primary,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('تسجيل', style: UITextStyle.titleBold)
                    ],
                  ),
                  onPressed: () {
                    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
                    print("Token: $token");
                    registerForCourse(widget.courseId,token!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
