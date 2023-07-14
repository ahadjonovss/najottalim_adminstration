import 'package:najottalim_adminstration/ui/groups/bloc/add_group_bloc/add_group_bloc.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class GroupTextField extends StatelessWidget {
  String label;
  GroupTextField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.h),
      child: TextField(
          onChanged: (value) {
            context.read<AddGroupBloc>().add(UpdateGroupInfoEvent(
                  lessonTime: label == "lesson_time" ? value : null,
                  groupName: label == "group_name" ? value : null,
                  room: label == "specific_room" ? value : null,
                ));
          },
          style: AppTextStyles.labelLarge(context),
          cursorColor: AdaptiveTheme.of(context).theme.cardColor,
          autofocus: true,
          decoration: InputDecoration(
              labelStyle: AppTextStyles.labelLarge(context,
                  color: AdaptiveTheme.of(context).theme.cardColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AdaptiveTheme.of(context).theme.cardColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AdaptiveTheme.of(context).theme.cardColor),
              ),
              label: Text(label.tr),
              hintStyle: AppTextStyles.labelLarge(context,
                  color: AdaptiveTheme.of(context).theme.focusColor),
              hintText: label == "group_name"
                  ? "enter_group_name".tr
                  : label == "specific_room"
                      ? "enter_room_name".tr
                      : "enter_lesson_time".tr,
              border: const OutlineInputBorder())),
    );
  }
}
