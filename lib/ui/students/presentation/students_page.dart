import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.h),
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
                  Text("add_student".tr,
                      style: AppTextStyles.labelLarge(context,
                          fontSize: 16.h, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Divider(color: AdaptiveTheme.of(context).theme.focusColor),
            SizedBox(height: 12.h),
            BlocProvider(
              create: (context) => StudentsBloc()..add(GetAllUsersEvent()),
              child: BlocBuilder<StudentsBloc, StudentsState>(
                builder: (context, state) {
                  if (state.status == ResponseStatus.inSuccess) {
                    List<StudentModel> students = state.students;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: students.length,
                        itemBuilder: (context, index) =>
                            StudentItem(student: students[index]));
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
