import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dallal/Userpref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class server{
  static String serverUrl='http://192.168.1.10:96/api/';
}
niceDialog(BuildContext context, dynamic result,
    {bool popAfterComplete = true}) {
  print(result);
  AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    headerAnimationLoop: false,
    dialogType: result is bool
        ? result
        ? DialogType.SUCCES
        : DialogType.ERROR
        : DialogType.ERROR,
    title: result is bool
        ? result
        ? 'Successful'
        : 'Failed'
        : 'Failed',
    desc: result is bool
        ? result
        ? 'Successful'
        : 'Failed'
        : result,
    btnOkOnPress: () {
      if (popAfterComplete) Get.back();;
    },
    btnOkText: 'OK',
    // btnOkIcon: result ? Icons.check_circle : Icons.cancel,
  )..show();
}

showMessage(BuildContext context, String message) {
  AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    headerAnimationLoop: false,
    dialogType: DialogType.WARNING,
    title: "WARNING",
    desc: message,
    // btnOkOnPress: () {
    //   if (popAfterComplete) Navigator.pop(context);
    // },
    btnOkText: 'OK',
    // btnOkIcon: result ? Icons.check_circle : Icons.cancel,
  )..show();
}
final UserPreferences userPreferences = UserPreferences();
