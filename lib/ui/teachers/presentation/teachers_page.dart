import 'package:najottalim_adminstration/ui/teachers/bloc/teachers_bloc/teachers_bloc.dart';
import 'package:najottalim_adminstration/ui/teachers/presentation/widgets/teacher_item.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            OnTap(
              onTap: () {
                Navigator.pushNamed(context, RouteName.addStudent);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.group_add,
                    size: 32.h,
                    color: AppColors.c006ED1,
                  ),
                  SizedBox(width: 12.h),
                  Text("add_teacher".tr,
                      style: AppTextStyles.labelLarge(context,
                          fontSize: 16.h, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Divider(color: AdaptiveTheme.of(context).theme.focusColor),
            SizedBox(height: 8.h),
            BlocBuilder<TeachersBloc, TeachersState>(
              builder: (context, state) {
                if (state.status == ResponseStatus.inSuccess) {
                  List<TeacherModel> teachers = state.teachers;
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: teachers.length,
                        itemBuilder: (context, index) => TeacherItem(
                              teacher: teachers[index],
                            )),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
