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
            context.read<AddStudentBloc>().add(UpdateInfoEvent(
                name: label == "name" ? value : null,
                surname: label == "name" ? null : value));
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
              border: OutlineInputBorder())),
    );
  }
}
