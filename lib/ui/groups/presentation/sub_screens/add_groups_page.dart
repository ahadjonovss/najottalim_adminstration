import 'package:flutter/cupertino.dart';
import 'package:najottalim_adminstration/ui/groups/bloc/add_group_bloc/add_group_bloc.dart';
import 'package:najottalim_adminstration/ui/groups/presentation/widgets/group_text_field.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddGroupsPage extends StatelessWidget {
  const AddGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        title: Text("add_student".tr),
      ),
      body: BlocProvider(
        create: (context) => AddGroupBloc(),
        child: BlocConsumer<AddGroupBloc, AddGroupState>(
          listener: (context, state) {
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
                            "${state.groupName} ${"created_successfully".tr}"),
                      ));
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20.h),
              height: height(context),
              width: width(context),
              child: Column(
                children: [
                  GroupTextField(label: "group_name"),
                  GroupTextField(label: "specific_room"),
                  GroupTextField(label: "lesson_time"),
                  if (state.groupName.isNotEmpty && state.room.isNotEmpty)
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<AddGroupBloc>()
                                  .add(SaveGroupEvent());
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
              ),
            );
          },
        ),
      ),
    );
  }
}
