import 'package:flutter/cupertino.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddStudentToGroupPage extends StatefulWidget {
  GroupModel group;
  AddStudentToGroupPage({required this.group, super.key});

  @override
  State<AddStudentToGroupPage> createState() => _AddStudentToGroupPageState();
}

class _AddStudentToGroupPageState extends State<AddStudentToGroupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStudentToGroupBloc(),
      child: BlocConsumer<AddStudentToGroupBloc, AddStudentToGroupState>(
        listener: (context, addStudentState) {
          if (addStudentState.status == ResponseStatus.inProgress) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const CupertinoAlertDialog(
                      content: CircularProgressIndicator(),
                    ));
          } else if (addStudentState.status == ResponseStatus.inSuccess) {
            Navigator.pop(context);
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
                      content: Text("successfully_added".tr),
                    ));

            context.read<StudentsBloc>().add(GetAllUsersEvent());
          }
        },
        builder: (context, selectStudentState) {
          return Scaffold(
            backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
              title: Text(widget.group.groupName),
              actions: [
                if (selectStudentState.selectedStudents.isNotEmpty)
                  OnTap(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.h, top: 20.h),
                      child: Text("save".tr,
                          style: AppTextStyles.labelLarge(context,
                              color: Colors.blue, fontSize: 16.h)),
                    ),
                    onTap: () {
                      context.read<AddStudentToGroupBloc>().add(
                          AddStudentsToTheGroupEvent(
                              widget.group.students.cast(),
                              widget.group.groupId));
                    },
                  )
              ],
              centerTitle: false,
            ),
            body: BlocBuilder<StudentsBloc, StudentsState>(
              builder: (context, state) {
                if (state.status == ResponseStatus.inSuccess) {
                  List<StudentModel> students = state.students;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: students.length,
                      itemBuilder: (context, index) => SelectableStudentItem(
                          isSelected: selectStudentState.selectedStudents
                              .contains(students[index]),
                          onTap: () {
                            context
                                .read<AddStudentToGroupBloc>()
                                .add(SelectStudentEvent(students[index]));
                            setState(() {});
                          },
                          student: students[index]));
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
