// class AppUrlLauncher {
//
//   static void openUrl({required String link}) async {
//     var uri = Uri.parse(link);
//     print(link);
//     if (await canLaunch(uri.toString())) {
//       await launch(uri.toString());
//
//     } else {
//       throw 'Could not launch ${uri.toString()}';
//     }
//   }
//
// }
