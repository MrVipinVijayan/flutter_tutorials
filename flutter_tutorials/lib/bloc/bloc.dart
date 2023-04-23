import 'package:flutter_tutorials/bloc/model/form_item.dart';
import 'package:flutter_tutorials/bloc/state.dart';
import 'package:flutter_tutorials/utils/exports.dart';

class FormBloc extends Bloc<FormScreenEvent, AppFormState> {
  FormBloc() : super(const AppFormState()) {
    on<InitEvent>(_initState);
    on<EmailChanged>(_onEmailChanged);
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<FormSubmitEvent>(_onFormSubmitted);
    on<FormResetEvent>(_onFormReset);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _initState(InitEvent event, Emitter<AppFormState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<AppFormState> emit) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isValidName ? null : 'Enter name',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<AppFormState> emit) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isValidEmail ? null : 'Enter email',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChanged(
      PhoneChanged event, Emitter<AppFormState> emit) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isValidPhone ? null : 'Enter phone',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormReset(
    FormResetEvent event,
    Emitter<AppFormState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onFormSubmitted(
    FormSubmitEvent event,
    Emitter<AppFormState> emit,
  ) async {
    if (state.formKey!.currentState!.validate()) {
      goHome();
    }
  }
}
