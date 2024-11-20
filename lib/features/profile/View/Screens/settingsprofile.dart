import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:clinic_system_patient/features/profile/View/Screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Settingsprofile extends StatefulWidget {
  const Settingsprofile({Key? key}) : super(key: key);

  @override
  State<Settingsprofile> createState() => _SettingsprofileState();
}

class _SettingsprofileState extends State<Settingsprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاعدادات'),
        leading:  IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.DoctorCard); // العودة للصفحة السابقة
          },
          icon: Image.asset(ImageAssets.arrowBack),
        ),
      ),
    );
  }
}
