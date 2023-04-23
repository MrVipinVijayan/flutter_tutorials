import 'package:equatable/equatable.dart';
import 'package:flutter_tutorials/bloc/model/form_item.dart';
import 'package:flutter_tutorials/utils/exports.dart';

class AppFormState extends Equatable {
  const AppFormState({
    this.email = const BlocFormItem(error: 'Enter email'),
    this.name = const BlocFormItem(error: 'Enter name'),
    this.phone = const BlocFormItem(error: 'Enter phone'),
    this.formKey,
  });

  final BlocFormItem email;
  final BlocFormItem name;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  AppFormState copyWith({
    BlocFormItem? email,
    BlocFormItem? name,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return AppFormState(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  List<Object> get props => [email, name, phone];
}

enum FormStatus { none, inProgress, valid, invalid }
