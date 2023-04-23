class BlocFormItem {
  final String? error;
  final String value;
  const BlocFormItem({this.error, this.value = ''});

  BlocFormItem copyWith({
    String? error,
    String? value,
  }) {
    return BlocFormItem(
      error: error ?? this.error,
      value: value ?? this.value,
    );
  }
}
