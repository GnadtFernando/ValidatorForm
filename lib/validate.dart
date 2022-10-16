import 'package:flutter/cupertino.dart';

class Validate {
  bool isChecked = false;
  bool valid = false;
  bool isCpf = false;
  final text1 = TextEditingController();
  final text2 = TextEditingController();
  final text3 = TextEditingController();
  final text4 = TextEditingController();
  final key1 = GlobalKey<FormFieldState>();
  final key2 = GlobalKey<FormFieldState>();
  final key3 = GlobalKey<FormFieldState>();
  final key4 = GlobalKey<FormFieldState>();

  bool validate() {
    if (((key1.currentState?.validate() ?? false) &&
            (key2.currentState?.validate() ?? false) &&
            (key3.currentState?.validate() ?? false)) ||
        ((key1.currentState?.validate() ?? false) &&
            (key4.currentState?.validate() ?? false))) {
      return valid = true;
    } else {
      return valid = false;
    }
  }
}
