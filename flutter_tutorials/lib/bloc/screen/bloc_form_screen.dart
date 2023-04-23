import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/bloc.dart';
import 'package:flutter_tutorials/bloc/event.dart';
import 'package:flutter_tutorials/bloc/model/form_item.dart';
import 'package:flutter_tutorials/bloc/state.dart';
import 'package:flutter_tutorials/utils/exports.dart';

class BlocFormScreen extends StatelessWidget {
  const BlocFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: BlocBuilder<FormBloc, AppFormState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                CustomFormField(
                  hintText: 'Name',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(NameChanged(name: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.name.error;
                  },
                ),
                CustomFormField(
                  hintText: 'Email',
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(EmailChanged(email: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.email.error;
                  },
                ),
                CustomFormField(
                  hintText: 'Phone',
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(PhoneChanged(phone: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.phone.error;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<FormBloc>(context)
                            .add(const FormSubmitEvent());
                      },
                      child: const Text('SUBMIT'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<FormBloc>(context)
                            .add(const FormResetEvent());
                      },
                      child: const Text('RESET'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
