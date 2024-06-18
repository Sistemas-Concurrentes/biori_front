String? onValidateTitle(String onValidateVal, String? error) {
  return onValidateVal.isEmpty ? error ?? "Error" : null;
}

String? onValidateDescription(String onValidateVal, String? error) {
  return onValidateVal.isEmpty ? error ?? "Error" : null;
}

String? onValidateCategory(String? onValidateVal, String? error) {
  if (onValidateVal == null || onValidateVal.isEmpty) {
    return error ?? "Error";
  }
  return null;
}

String? onValidateDates(String? onValidate, String? error) {
  if (onValidate == null || onValidate.isEmpty || onValidate == " ") {
    return error ?? "Error";
  }
  return null;
}

String? onValidateInscriptionDate(
    String? onValidate, String? error, bool isCheckedForInscriptionDate) {
  if (isCheckedForInscriptionDate &&
      (onValidate == null || onValidate.isEmpty)) {
    return error ?? "Error";
  }
  return null;
}

String? onValidateLocation(String? onValidate, String? error) {
  if (onValidate == null || onValidate.isEmpty) {
    return error ?? "Error";
  }
  return null;
}
