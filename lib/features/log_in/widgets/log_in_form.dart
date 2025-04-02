import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/shared/app_btn.dart';
import '../../../core/shared/app_text_field.dart';
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
          Container(
            alignment: Alignment.center,
            child: AppBtn(text: AppStrings.logInTitle, onPressed: () {})),
        ],
      ),
    );
  }

  AppTextField _buildEmailTextField(LogInController logInController) {
    return AppTextField(
      controller: logInController.emailController,
      hintText: AppStrings.logInEmailHintText,
    );
  }

  Obx _buildPasswordTextField(LogInController logInController) {
    return Obx(
      () => AppTextField(
        controller: logInController.passwordController,
        hintText: AppStrings.logInPasswordHintText,
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
