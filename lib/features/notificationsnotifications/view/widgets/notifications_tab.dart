
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

import '../../../../core/resources/stayels_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../data/models/notification_model.dart';
import 'notification_items.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({super.key});

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  List<NotificationModel> notifications = [
    NotificationModel(
        type: Type.sure,
        message: "تم تأكيد حجز الباطنه بنجاح",
        typeNotification: "تأكيد الحجز"),
    NotificationModel(
        type: Type.cancel,
        message: "تم الغاء حجز الباطنه",
        typeNotification: "الغاء الحجز"),
    NotificationModel(
        type: Type.info,
        message:
            "لقد تلقيت استشارة جديده",
        typeNotification: "استشارة لديك "),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.s30.h,
            ),
            Center(
              child: Text(
                "الاشعارات",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24,
                ),
              ),
            ),
            SizedBox(
              height: Sizes.s30.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) => NotificationItems(
                  notificationModel: notifications[index],
                ),
                separatorBuilder: (_, index) => SizedBox(
                  height: Sizes.s20.h,
                ),
                itemCount: notifications.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
