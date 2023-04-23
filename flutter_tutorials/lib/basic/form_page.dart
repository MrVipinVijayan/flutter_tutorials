import 'package:flutter_tutorials/utils/exports.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Name',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (null != val && !val.isValidName) {
                    return 'Enter valid name';
                  }
                  return null;
                },
              ),
              CustomFormField(
                hintText: 'Email',
                validator: (val) {
                  if (null != val && !val.isValidEmail) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              CustomFormField(
                hintText: 'Phone',
                validator: (val) {
                  if (null != val && !val.isValidPhone) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        goHome();
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    child: const Text('RESET'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
