import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/enums/enums.dart';

class StatusHelper {
  static OrderStatusEnum getStatusEnum(int? status) {
    if (status == 1) {
      return OrderStatusEnum.Pending;
    } else if (status == 2) {
      return OrderStatusEnum.Preparing;
    } else if (status == 3) {
      return OrderStatusEnum.On_The_Way;
    } else if (status == 4) {
      return OrderStatusEnum.Five_Minutes_Away;
    } else if (status == 5) {
      return OrderStatusEnum.Delivered;
    } else if (status == 6) {
      return OrderStatusEnum.Cancelled;
    } else if (status == 7) {
      return OrderStatusEnum.Two_Minutes_Away;
    } else if (status == 8) {
      return OrderStatusEnum.Rejected_By_Admin;
    } else if (status == 9) {
      return OrderStatusEnum.Confirm_Price;
    } else if (status == 10) {
      return OrderStatusEnum.Rejected_By_Client;
    } else if (status == 11) {
      return OrderStatusEnum.Received;
    }
    return OrderStatusEnum.Received;
  }

  static Color getOrderStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.Received:
        return Colors.teal;
      case OrderStatusEnum.Pending:
        return Colors.yellow.shade700;
      case OrderStatusEnum.Preparing:
        return Colors.orange;
      case OrderStatusEnum.On_The_Way:
        return Colors.blue.shade200;

      case OrderStatusEnum.Five_Minutes_Away:
        return Colors.blue.shade500;
      case OrderStatusEnum.Two_Minutes_Away:
        return Colors.blue.shade900;

      case OrderStatusEnum.Confirm_Price:
        return Colors.orange;

        ///////////////////////////////////////
      case OrderStatusEnum.Delivered:
        return Colors.green.shade900;

      case OrderStatusEnum.Cancelled:
      case OrderStatusEnum.Rejected_By_Client:
      case OrderStatusEnum.Rejected_By_Admin:
        return Colors.red.shade900;
      default:
        return Colors.red;
    }
  }

  static int getStatusIndex(int? status) {
    if (status == 1) {
      return 0;
    } else if (status == 11) {
      return 1;
    } else if (status == 9) {
      return 2;
    } else if (status == 2) {
      return 3;
    } else if (status == 3) {
      return 4;
    } else if (status == 4) {
      return 5;
    } else if (status == 7) {
      return 6;
      // deleiverd
    } else if (status == 5) {
      return 7;
      // canecl
    } else if (status == 6) {
      return 7;
      // reject
    } else if (status == 8) {
      return 7;
      // reject
    } else if (status == 10) {
      return 7;
    }
    return 0;
  }
}
