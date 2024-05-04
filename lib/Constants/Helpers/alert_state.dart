import 'package:flutter/material.dart';
import '../colors.dart';

class AlertState{
  static Color getAlertState(String alertState) {
    switch (alertState) {
      case "warning":
        return UIColors.alertWarning;
      case "info":
        return UIColors.alertInfo;
      case "danger":
        return UIColors.alertDanger;
      default:
        return UIColors.unjustified;
    }
  }
}

class AlertStateIcon{
  static IconData getAlertState(String alertState) {
    switch (alertState) {
      case "warning":
        return Icons.warning;
      case "info":
        return Icons.info;
      case "danger":
        return Icons.back_hand;
      default:
        return Icons.notifications;
    }
  }
}