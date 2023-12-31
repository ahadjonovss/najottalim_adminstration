import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        title: Text("add_student".tr),
      ),
      body: BlocProvider(
        create: (context) => AddStudentBloc(),
        child: BlocConsumer<AddStudentBloc, AddStudentState>(
          listener: (context, state) async {
            if (state.status == ResponseStatus.inFail) {
              AnimatedSnackBar(
                builder: (context) => AppErrorSnackBar(text: state.message),
              ).show(context);
            } else if (state.status == ResponseStatus.inSuccess) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RouteName.home, (route) => false);
                              },
                              child: const Text("OK"))
                        ],
                        content: Text(
                            "${state.name} ${state.surname} ${"successfully_added".tr}"),
                      ));
              context.read<StudentsBloc>().add(GetAllUsersEvent());
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20.h),
              height: height(context),
              width: width(context),
              child: Column(
                children: [
                  CustomTextField(label: "surname"),
                  CustomTextField(label: "name"),
                  if (state.name.isNotEmpty && state.surname.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("${"email".tr}:   ",
                                style: AppTextStyles.labelLarge(context,
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .cardColor)),
                            Text(state.email,
                                style: AppTextStyles.labelLarge(context))
                          ],
                        ),
                        Row(
                          children: [
                            Text("${"password".tr}:   ",
                                style: AppTextStyles.labelLarge(context,
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .cardColor)),
                            Text("12345678",
                                style: AppTextStyles.labelLarge(context))
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () async {
                                  context
                                      .read<AddStudentBloc>()
                                      .add(SaveStudentEvent());
                                  await Clipboard.setData(
                                      ClipboardData(text: state.email));
                                },
                                child: state.status == ResponseStatus.inProgress
                                    ? CircularProgressIndicator(
                                        color: AdaptiveTheme.of(context)
                                            .theme
                                            .cardColor)
                                    : Text(
                                        "save".tr,
                                        style: AppTextStyles.labelLarge(context,
                                            color: AdaptiveTheme.of(context)
                                                .theme
                                                .cardColor),
                                      )))
                      ],
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
