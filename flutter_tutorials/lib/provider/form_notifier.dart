import 'package:flutter_tutorials/utils/exports.dart';

class FormNotifier extends ChangeNotifier {
  var _formMap = {};
  final formKey = GlobalKey<FormState>();

  FormNotifier() {
    _formMap = {
      'title': const FormItem(hintText: 'Form Validation'),
      'name': FormItem(
        hintText: 'Name',
        errorMessage: 'Please enter valid name',
        formatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
        ],
      ),
      'email': const FormItem(
        hintText: 'Email',
        errorMessage: 'Please enter valid email',
      ),
      'phone': const FormItem(
        hintText: 'Phone',
        errorMessage: 'Please enter valid phone',
      ),
      'submit': const FormItem(hintText: 'SUBMIT'),
      'reset': const FormItem(hintText: 'RESET'),
    };
  }

  FormItem get title => _formMap['title'];
  FormItem get name => _formMap['name'];
  FormItem get email => _formMap['email'];
  FormItem get phone => _formMap['phone'];
  FormItem get submit => _formMap['submit'];
  FormItem get reset => _formMap['reset'];

  validateName(String? val) {
    if (null != val && !val.isValidName) {
      return name.errorMessage;
    }
    return null;
  }

  validateEmail(String? val) {
    if (null != val && !val.isValidEmail) {
      return email.errorMessage;
    }
    return null;
  }

  validPhone(String? val) {
    if (null != val && !val.isValidPhone) {
      return phone.errorMessage;
    }
    return null;
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      return goHome();
    }
  }

  resetForm() => formKey.currentState?.reset();
}
