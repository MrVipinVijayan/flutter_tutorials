import 'package:equatable/equatable.dart';
import 'package:flutter_tutorials/bloc/model/form_item.dart';

abstract class FormScreenEvent extends Equatable {
  const FormScreenEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitEvent extends FormScreenEvent {
  const FormSubmitEvent();
}

class FormResetEvent extends FormScreenEvent {
  const FormResetEvent();
}

class InitEvent extends FormScreenEvent {
  const InitEvent();
}

class EmailChanged extends FormScreenEvent {
  const EmailChanged({required this.email});
  final BlocFormItem email;
  @override
  List<Object> get props => [email];
}

class NameChanged extends FormScreenEvent {
  const NameChanged({required this.name});
  final BlocFormItem name;
  @override
  List<Object> get props => [name];
}

class PhoneChanged extends FormScreenEvent {
  const PhoneChanged({required this.phone});
  final BlocFormItem phone;

  @override
  List<Object> get props => [phone];
}
