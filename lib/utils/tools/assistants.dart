import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

bool isRussianString(String input) {
  // Regular expression to match Cyrillic characters
  final russianPattern = RegExp(r'[а-яА-ЯЁё]');

  // Check if the input string contains any Russian characters
  return russianPattern.hasMatch(input);
}

String formatPhoneNumber(String phone) {
  return "${phone.substring(0, 4)} ${phone.substring(4, 6)} ${phone.substring(6, 9)}-${phone.substring(9, 11)}-${phone.substring(11, 13)}";
}

String errorFinder({
  required TextEditingController name,
  required TextEditingController lastName,
  required TextEditingController middleName,
  required TextEditingController dob,
}) {
  bool isNameValidated = name.text.length < 2;
  bool isLastNameValidated = lastName.text.length < 2;
  bool isDobValidated = dob.text.isEmpty;

  if (isLastNameValidated) {
    return "last_name_is_not_valid";
  } else if (isNameValidated) {
    return "name_is_not_valid";
  } else if (isDobValidated) {
    return "dob_is_not_valid";
  } else {
    return '';
  }
}

//MediaQueries

double height(context) => MediaQuery.of(context).size.height;
double width(context) => MediaQuery.of(context).size.width;

BallSpecifics makeBallSpecifics(int ball) {
  if (ball >= 90) {
    return BallSpecifics(
        backgroundImage: AppIcons.more90,
        ball: ball,
        backgroundAllignment: Alignment.centerLeft,
        gradient: [Colors.green, Colors.greenAccent]);
  } else if (ball <= 90 && ball > 70) {
    return BallSpecifics(
        backgroundImage: AppIcons.less90,
        ball: ball,
        backgroundAllignment: Alignment.centerLeft,
        gradient: [Colors.orange, Colors.orangeAccent]);
  } else if (ball <= 70 && ball > 50) {
    return BallSpecifics(
        backgroundImage: AppIcons.less70,
        ball: ball,
        backgroundAllignment: Alignment.centerLeft,
        gradient: [Colors.orange, Colors.orangeAccent]);
  } else {
    return BallSpecifics(
        backgroundImage: AppIcons.less50,
        ball: ball,
        backgroundAllignment: Alignment.centerLeft,
        gradient: [Colors.red.shade700, Colors.redAccent]);
  }
}
