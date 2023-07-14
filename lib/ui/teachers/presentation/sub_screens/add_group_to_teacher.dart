import 'package:flutter/cupertino.dart';
import 'package:najottalim_adminstration/ui/teachers/bloc/add_group_to_teacher_bloc/add_group_to_teacher_bloc.dart';
import 'package:najottalim_adminstration/ui/teachers/presentation/widgets/selectable_group_item.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddGroupToTeacherPage extends StatefulWidget {
  TeacherModel teacher;
  AddGroupToTeacherPage({required this.teacher, super.key});

  @override
  State<AddGroupToTeacherPage> createState() => _AddGroupToTeacherPageState();
}

class _AddGroupToTeacherPageState extends State<AddGroupToTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddGroupToTeacherBloc(),
      child: BlocConsumer<AddGroupToTeacherBloc, AddGroupToTeacherState>(
        listener: (context, addGroupState) {
          if (addGroupState.status == ResponseStatus.inProgress) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const CupertinoAlertDialog(
                      content: CircularProgressIndicator(),
                    ));
          } else if (addGroupState.status == ResponseStatus.inSuccess) {
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

            context.read<TeachersBloc>().add(GetAllTeachersEvent());
          }
        },
        builder: (context, selectGroupsState) {
          return Scaffold(
            backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
              title: Text("${widget.teacher.name} ${widget.teacher.surname}"),
              actions: [
                if (selectGroupsState.selectedGroups.isNotEmpty)
                  OnTap(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.h, top: 20.h),
                      child: Text("save".tr,
                          style: AppTextStyles.labelLarge(context,
                              color: Colors.blue, fontSize: 16.h)),
                    ),
                    onTap: () {
                      context.read<AddGroupToTeacherBloc>().add(
                          AddGroupsToTheTeacherEvent(widget.teacher.groupIds,
                              widget.teacher.teacherId));
                    },
                  )
              ],
              centerTitle: false,
            ),
            body: BlocBuilder<GroupsBloc, GroupsState>(
              builder: (context, state) {
                if (state.status == ResponseStatus.inSuccess) {
                  List<GroupModel> groups = state.groups;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: groups.length,
                      itemBuilder: (context, index) => SelectableGroupItem(
                          teacher: widget.teacher,
                          isSelected: selectGroupsState.selectedGroups
                              .contains(groups[index]),
                          onTap: () {
                            context
                                .read<AddGroupToTeacherBloc>()
                                .add(SelectGroupEvent(groups[index]));
                            setState(() {});
                          },
                          group: groups[index]));
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
