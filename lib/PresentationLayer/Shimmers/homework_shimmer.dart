import 'package:flutter/material.dart';
import 'package:graduation/PresentationLayer/Shimmers/shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';

class HomeworkShimmer extends StatelessWidget {
  const HomeworkShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: UIColors.shimmerBaseColor,
      highlightColor: UIColors.shimmerHighLightColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: Get.width,
          height: 56,
          margin: const EdgeInsets.symmetric(vertical: 8),
          //padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(flex: 2,
                  child: ShimmerWidget.roundedRectangular(width: Get.width, height: 40,)),
            ],
          ),
        ),
      ),
    );
  }
}
