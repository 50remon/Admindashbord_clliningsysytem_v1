import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';

import '../../../../../core/resources/stayels_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class CustomListViewWithLabel extends StatelessWidget {
  const CustomListViewWithLabel({
    super.key,
    required this.label,
    required this.itemBuilder,
    required this.itemCount,
    required this.heightListView,
  });

  final String label;
  final double heightListView;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: FontSize.s18,
          ),
        ),
        SizedBox(
          height: Sizes.s10.h,
        ),
        SizedBox(
          height: heightListView,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder,
            separatorBuilder: (_, index) => SizedBox(
              width: Sizes.s15.h,
            ),
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}
