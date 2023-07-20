import 'package:flutter/material.dart';
import 'package:flutter_tutorials/custom_form_field.dart';
import 'package:flutter_tutorials/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text('Email'),
            CustomFormField(
              hintText: 'Enter email',
              validator: (value) => controller.validateEmail(value),
            ),
            const SizedBox(height: 12),
            const Text('Password'),
            CustomFormField(
              hintText: 'Enter Password',
              validator: (value) => controller.validatePassword(value),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => controller.onLogin(),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
