import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation/Constants/colors.dart';
import 'package:graduation/Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/advert_service.dart';
import '../../Widgets/one_advert.dart';


class All_Advert extends StatefulWidget {
  const All_Advert({super.key});
  static const routename = '/all_advert';

  @override
  State<All_Advert> createState() => _All_AdvertState();
}

class _All_AdvertState extends State<All_Advert> {
  Future<List<Advert>>? futureadvert;
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
    _loadAdvert();
  }

  void _loadAdvert() async {
    final String? token = await storage.read('token');
    if (token != null) {
      setState(() {
        futureadvert = AdvertService.fetchAdverts(token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final Size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme:const IconThemeData(color:UIColors.white),
          backgroundColor: Colors.transparent,
          title: Center(child: Text("الإعلانات",style: UITextStyle.titleBold,)),
          flexibleSpace: Container(
            decoration:const BoxDecoration(
                color: UIColors.primary,
                borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight:Radius.circular(35),
                )),
          ),
        ),
        body:Center(
          child: FutureBuilder<List<Advert>>(
            future: futureadvert,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No students found');
              } else {
                return ListView(
                  children: snapshot.data!
                    .map((data) => OneAdvert(
                    id: data.id.toString(),
                    title: 'إعلان جديد',
                    discription: data.description,
                    createdAt:data.createdAt,
                    courseId:data.courseId.toString(),

                    image:data.image,

                  ))
                      .toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
