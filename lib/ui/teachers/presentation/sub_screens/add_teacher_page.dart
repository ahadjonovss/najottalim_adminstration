import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:najottalim_adminstration/ui/teachers/bloc/add_teacher_bloc/add_teacher_bloc.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddTeacherPage extends StatelessWidget {
  const AddTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        title: Text("add_teacher".tr),
      ),
      body: BlocProvider(
        create: (context) => AddTeacherBloc(),
        child: BlocConsumer<AddTeacherBloc, AddTeacherState>(
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
                            "${state.name} ${state.surname} ${"teacher_added".tr}"),
                      ));
              context.read<TeachersBloc>().add(GetAllTeachersEvent());
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20.h),
              height: height(context),
              width: width(context),
              child: Column(
                children: [
                  CustomTextField(label: "surname", isTeacher: true),
                  CustomTextField(label: "name", isTeacher: true),
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
                                      .read<AddTeacherBloc>()
                                      .add(SaveTeacherEvent());
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
