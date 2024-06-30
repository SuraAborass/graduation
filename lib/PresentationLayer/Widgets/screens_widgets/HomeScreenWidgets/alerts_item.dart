import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';

class AlertsItem extends StatelessWidget {
  const AlertsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: UIColors.alert,
            ),
            width: 163,
            height: 114,
          ),
          Positioned( top: 15,right:20,
            child: Text('التنبيهات',
              style: UITextStyle.bodyNormal.copyWith(color: UIColors.white,fontSize: 25),),),
          Positioned(top: 50,right: 80,
              child: Container(height: 80, width: 110,
                decoration: const BoxDecoration(
                    color: UIColors.lightWhite,
                    borderRadius: BorderRadius. only(topRight: Radius.circular(25))
                ),
              )),
          const Positioned(top: 65,right:100,
              child: Icon(Ionicons.alert_circle_sharp,size: 43,color: UIColors.white,))
        ],
      ),
    );
  }
}
