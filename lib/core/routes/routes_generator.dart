import 'package:clinic_system_patient/core/routes/routes.dart';

import 'package:clinic_system_patient/features/auth/view/screen/login/new_password.dart';
import 'package:clinic_system_patient/features/auth/view/screen/register/authentication_success_screen.dart';
import 'package:clinic_system_patient/features/auth/view/screen/register/otp_code.dart';
import 'package:clinic_system_patient/features/profile/View/Screens/profile.dart';
import 'package:clinic_system_patient/features/profile/View/Screens/settingsprofile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../features/auth/view/screen/login/confirmation_new_password_screen.dart';
import '../../features/auth/view/screen/login/forgot_password.dart';
import '../../features/auth/view/screen/login/login_screen.dart';
import '../../features/auth/view/screen/register/register_screen.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

import '../resources/stayels_manager.dart';
import '../resources/values_manager.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case Routes.resetPasswordSuccess:
        return MaterialPageRoute(
            builder: (_) => const ConfirmationNewPasswordScreen());
      case Routes.otpCode:
        return MaterialPageRoute(builder: (_) => const OtpCode());
      case Routes.authenticationSuccess:
        return MaterialPageRoute(
            builder: (_) => const AuthenticationSuccessScreen());
      case Routes.settingsprfile:
        return MaterialPageRoute(
          builder: (_) => const Settingsprofile(),);
      case Routes.DoctorCard:
        return MaterialPageRoute(
          builder: (_) => DoctorCard(doctor: doctor),);

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.error404),
              SizedBox(
                height: Sizes.s15.h,
              ),
              SizedBox(
                width: 248,
                child: Center(
                  child: Text(
                    "حدث خطأ ما نأسف على ذلك",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
