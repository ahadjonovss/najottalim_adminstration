import 'package:najottalim_adminstration/ui/students/bloc/add_student/add_student_bloc.dart';
import 'package:najottalim_adminstration/ui/students/presentation/widgets/custom_text_field.dart';
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
        child: BlocBuilder<AddStudentBloc, AddStudentState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20.h),
              height: height(context),
              width: width(context),
              child: Column(
                children: [
                  CustomTextField(label: "name"),
                  CustomTextField(label: "surname"),
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
                            Text(
                                "${(state.name ?? '').toLowerCase()}${(state.surname ?? '').toLowerCase()}${DateTime.now().microsecond}@gmail.com",
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
                                onPressed: () {},
                                child: Text(
                                  "Saqlash",
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
