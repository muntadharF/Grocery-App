import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_text_styles.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing_helper.dart';
import '../../../core/shared/app_btn.dart';
import '../../../core/shared/app_text_field.dart';
import '../controllers/sign_up_controller.dart';
import 'terms_and_policy.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = getIt<SignUpController>();

    return Form(
      key: signUpController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextFieldLabel(AppStrings.signUpUsernameLabel),
          _buildUsernameTextField(signUpController),
          verticalSpace(22),

          _buildTextFieldLabel(AppStrings.signUpEmailLabel),
          _buildEmailTextField(signUpController),
          verticalSpace(22),

          _buildTextFieldLabel(AppStrings.signUpPasswordLabel),
          _buildPasswordTextField(signUpController),
          verticalSpace(12),

          const TermsAndPolicy(),
          verticalSpace(24),
          AppBtn(text: AppStrings.signUpTitle, onPressed: () {}),
        ],
      ),
    );
  }

  AppTextField _buildUsernameTextField(SignUpController signUpController) {
    return AppTextField(
      controller: signUpController.usernameController,
      hintText: AppStrings.signUpUsernameHintText,
    );
  }

  AppTextField _buildEmailTextField(SignUpController signUpController) {
    return AppTextField(
      controller: signUpController.emailController,
      hintText: AppStrings.signUpEmailHintText,
    );
  }

  Obx _buildPasswordTextField(SignUpController signUpController) {
    return Obx(
      () => AppTextField(
        controller: signUpController.passwordController,
        hintText: AppStrings.logInPasswordHintText,
        isObscureText: signUpController.isObscureText.value,
        suffixIcon: IconButton(
          onPressed: () => signUpController.toggleObscureText(),
          icon: Icon(
            signUpController.isObscureText.value
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
