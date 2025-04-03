import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/routing/app_screens.dart';
import '../../../core/shared/app_btn.dart';
import '../../../core/shared/app_text_form_field.dart';
import '../controllers/Log_in_controller.dart';
import 'forgot_password_btn.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController logInController = getIt<LogInController>();

    return Form(
      key: logInController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextFieldLabel(AppStrings.logInEmailLabel),
          _buildEmailTextField(logInController),

          verticalSpace(22),

          _buildTextFieldLabel(AppStrings.logInPasswordLabel),
          _buildPasswordTextField(logInController),

          verticalSpace(12),
          ForgotPasswordBtn(),
          verticalSpace(24),
          AppBtn(
            text: AppStrings.logInTitle,
            onPressed: () async {
              await logInController.logIn();

              if (logInController.isLoggedIn.value) {
                await SharedPrefHelper.setData(SharedPrefKeys.userLoggedIn, true);
                Navigator.pushReplacementNamed(context, AppScreens.homeScreen);
              }
            },
          ),
        ],
      ),
    );
  }

  AppTextFormField _buildEmailTextField(LogInController logInController) {
    return AppTextFormField(
      controller: logInController.emailController,
      hintText: AppStrings.logInEmailHintText,
      validator: logInController.validateEmail,
    );
  }

  Obx _buildPasswordTextField(LogInController logInController) {
    return Obx(
      () => AppTextFormField(
        controller: logInController.passwordController,
        hintText: AppStrings.logInPasswordHintText,
        validator: logInController.validatePassword,
        isObscureText: logInController.isObscureText.value,
        suffixIcon: IconButton(
          onPressed: () => logInController.toggleObscureText(),
          icon: Icon(
            logInController.isObscureText.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Text _buildTextFieldLabel(String label) {
    return Text(label, style: ApptTextStyles.font14Grey600Semibold);
  }
}
