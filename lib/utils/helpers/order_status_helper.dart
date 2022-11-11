import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/enums/enums.dart';

class StatusHelper {
  static OrderStatusEnum getStatusEnum(int? status) {
    if (status == 1) {
      return OrderStatusEnum.Received;
    } else if (status ==2) {
      return OrderStatusEnum.Preparing;
    } else if (status == 3) {
      return OrderStatusEnum.On_The_Way;
    } else if (status == 4) {
      return OrderStatusEnum.Five_Minutes_Away;
    } else if (status == 5) {
      return OrderStatusEnum.Delivered;
    } else if (status == 6) {
      return OrderStatusEnum.Cancelled;
    }
    else if (status == 7) {
      return OrderStatusEnum.Two_Minutes_Away;
    }
    return OrderStatusEnum.Received;
  }

  static Color getOrderStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.Received:
        return Colors.teal;
      case OrderStatusEnum.Preparing:
        return Colors.orange;
      case OrderStatusEnum.On_The_Way:
        return Colors.blue.shade200;
      case OrderStatusEnum.Five_Minutes_Away:
        return Colors.blue.shade500;
      case OrderStatusEnum.Two_Minutes_Away:
        return Colors.blue.shade900;
        case OrderStatusEnum.Delivered:
        return Colors.green.shade900;
        case OrderStatusEnum.Cancelled:
        return Colors.red.shade900;
      default:
        return Colors.red;
    }
  }

}