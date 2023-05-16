import 'package:flutter/material.dart';
import 'package:food_ninja/common/constants/assets_paths.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../common/constants/app_strings.dart';
import '../auth_header.dart';
import '../custom_auth_text_form_field.dart';
import 'social_auth_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AuthHeader(text: AppStrings.loginScreenHeader),
          SizedBox(
            height: 4.sh,
          ),
          Padding(
            padding: EdgeInsets.all(10.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomAuthTextFormField(
                  hintText: AppStrings.emailHint,
                  prefixIconSvgPath: AssetsPaths.messageSvgIcon,
                ),
                SizedBox(
                  height: 2.sh,
                ),
                const CustomAuthTextFormField(
                  hintText: AppStrings.passwordHint,
                  isObscureText: true,
                  prefixIconSvgPath: AssetsPaths.lockSvgIcon,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.orContinueText,
              style: TextStyle(
                fontSize: 2.sh,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 2.sh,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SocialAuthButton(
                text: AppStrings.google,
                assetPath: AssetsPaths.googleSvgIcon,
              ),
              SizedBox(
                width: 4.sw,
              ),
              const SocialAuthButton(
                text: AppStrings.facebook,
                assetPath: AssetsPaths.facebookSvgIcon,
              ),
            ],
          )
        ],
      ),
    );
  }
}
