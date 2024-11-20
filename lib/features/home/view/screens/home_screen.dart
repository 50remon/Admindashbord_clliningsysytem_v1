import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/features/consolution/screens/consolution.dart';
import 'package:clinic_system_patient/features/profile/View/Screens/profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/stayels_manager.dart';
import '../../../notificationsnotifications/view/widgets/notifications_tab.dart';
import '../widgets/home_tab/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTab(), // الصفحة الرئيسية
    NotificationsTab(), // الإشعارات
    ConsultationScreen(),//  الاستشارات
    DoctorCard(doctor: doctor),// الملف الشخصي
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.springWood,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grayishBlue,
        selectedLabelStyle: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s12,
        ),
        unselectedLabelStyle: getRegularStyle(
          color: ColorManager.grayishBlue,
          fontSize: FontSize.s12,
        ),
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                _selectedIndex == 0
                    ? ImageAssets.homeIconImgColored
                    : ImageAssets.homeIconImg,
              ),
            ),
            label: 'الصفحة الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                _selectedIndex == 1
                    ? ImageAssets.notificationIconImgColored
                    : ImageAssets.notificationIconImg,
              ),
            ),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                _selectedIndex == 2
                    ? ImageAssets.calendarCheckIconImgColored
                    : ImageAssets.calendarCheckIconImg,
              ),
            ),
            label: 'الاستشارات',
          ),

          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                _selectedIndex == 3
                    ? ImageAssets.userIconImgColored
                    : ImageAssets.userIconImg,
              ),
            ),
            label: 'الملف',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabs,
      ),
    );
  }
}
