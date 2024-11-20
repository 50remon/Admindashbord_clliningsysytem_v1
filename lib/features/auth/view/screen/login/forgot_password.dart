
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/stayels_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/custom_elvated.dart';
import '../../../../../core/widgets/custom_text.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const ImageIcon(
            size: 24,
            AssetImage(ImageAssets.arrowBack),
          ),
        ),
        title: const Text(
          "نسيت كلمة المرور",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Sizes.s60.h,
              ),
              Text(
                "اعادة تعيين كلمة المرور الخاصه بك",
                style: getRegularStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s15,
                ),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              CustomTextField(
                backgroundColor: ColorManager.white,
                hint: 'ادخل البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
                validation: Validator.validateEmail,
                controller: _emailController,
              ),
              SizedBox(
                height: Sizes.s83.h,
              ),
              CustomElevatedButton(
                label: 'ارسل الرمز',
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.resetPassword),
              ),
              SizedBox(
                height: Sizes.s40.h,
              ),
              Image.asset(ImageAssets.forgotPassword)
            ],
          ),
        ),
      ),
    );
  }
}
