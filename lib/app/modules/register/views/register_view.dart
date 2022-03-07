import 'package:drinks_everywhere/app/routes/app_pages.dart';
import 'package:drinks_everywhere/app/widgets/button_loading.dart';
import 'package:drinks_everywhere/app/widgets/edit_text_widget.dart';
import 'package:drinks_everywhere/app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _title(context),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, bottom: 16, top: 32),
      child: SizedBox(
        width: Get.width,
        child: Text(
          'Register',
          style: titleStyle,
          textAlign: TextAlign.center,
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 20),
          child: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                _nameField(),
                _emailField(),
                _passwordField(),
                _passwordConfirmField(),
                const SizedBox(height: 48),
                _signUpButtonSubmit(context),
                _signUpText(),
                _logInButtonSubmit(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: EditTextWidget(
          controller: controller.nameController,
          errorMessage: controller.nameError.value,
          showValidated: controller.nameValidation.value,
          onChanged: (value) {
            controller.nameError.value = '';
            controller.nameValidation.value =
                controller.nameController.text.length >= 3;
          },
          keyboardType: TextInputType.text,
          labelText: 'Name',
        ),
      );
    });
  }

  Widget _emailField() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: EditTextWidget(
          controller: controller.emailController,
          errorMessage: controller.emailError.value,
          showValidated: controller.emailValidation.value,
          onChanged: (value) {
            controller.emailError.value = '';
            controller.emailValidation.value =
                controller.emailController.text.isEmail;
          },
          keyboardType: TextInputType.emailAddress,
          labelText: "Email",
        ),
      );
    });
  }

  Widget _passwordField() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: EditTextWidget(
          controller: controller.passwordController,
          errorMessage: controller.passwordError.value,
          obscureText: true,
          labelText: "Password",
          onChanged: (value) {
            controller.passwordError.value = '';
          },
        ),
      );
    });
  }

  Widget _passwordConfirmField() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: EditTextWidget(
          controller: controller.passwordConfirmController,
          errorMessage: controller.passwordConfirmError.value,
          obscureText: true,
          labelText: "Confirm password",
          onChanged: (value) {
            controller.passwordConfirmError.value = '';
          },
        ),
      );
    });
  }

  Widget _signUpButtonSubmit(BuildContext context) {
    return Obx(() {
      return ButtonLoading(
        text: 'SIGN UP',
        loading: controller.loading.value,
        onPressed: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.registerWithEmail(
              controller.nameController.text,
              controller.emailController.text,
              controller.passwordController.text,
              controller.passwordConfirmController.text);
        },
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xfff1592a),
        ),
      );
    });
  }

  Widget _signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SvgPicture.string(
            '<svg viewBox="20.0 525.0 75.0 1.0" ><path transform="translate(-405.0, -50.0)" d="M 425.0000305175781 575 L 500.0000305175781 575" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        const Text(
          '  Already have an account?  ',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Color(0xff666666),
            fontWeight: FontWeight.w500,
            height: 1.0714285714285714,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        SvgPicture.string(
          '<svg viewBox="285.0 525.0 75.0 1.0" ><path transform="translate(-140.0, -50.0)" d="M 425.0000305175781 575 L 500.0000305175781 575" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        )
      ],
    );
  }

  Widget _logInButtonSubmit(BuildContext context) {
    return ButtonLoading(
      text: 'LOG IN',
      loading: false,
      onPressed: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        Get.toNamed(Routes.LOGIN);
      },
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff7ed321),
      ),
    );
  }
}
