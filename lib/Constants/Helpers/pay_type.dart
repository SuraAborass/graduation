import 'package:get/get.dart';

class PayType{
  static String getPayType(int payType) {
    if (payType == 1) return 'دفع مباشر';
    return 'تحويل بنكي';
  }
}

