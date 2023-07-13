import 'package:najottalim_adminstration/ui/students/bloc/add_student/add_student_bloc.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class CustomTextField extends StatelessWidget {
  String label;
  CustomTextField({required this.label, super.key});

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
              hintText: label == "name"
                  ? "enter_name_of_the_student".tr
                  : "enter_surname_of_the_student".tr,
              border: OutlineInputBorder())),
    );
  }
}
