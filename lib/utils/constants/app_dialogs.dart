import '../tools/file_importer.dart';

void showAppDialog(
    {required BuildContext context,
    Widget? title,
    Widget? content,
    String? confirmTitle,
    VoidCallback? onConfirm}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
            title: title,
            content: content,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel".tr)),
              TextButton(
                  onPressed: onConfirm, child: Text(confirmTitle ?? "save".tr)),
            ],
          ));
}
