import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class SelectableStudentItem extends StatelessWidget {
  StudentModel student;
  SelectableStudentItem({required this.student, super.key});

  @override
  Widget build(BuildContext context) {
    return student.groupId.isEmpty
        ? OnTap(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              width: width(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              AdaptiveTheme.of(context).theme.hintColor,
                          radius: 22,
                          backgroundImage: const AssetImage(AppImages.Logo)),
                      SizedBox(
                        width: width(context) * 0.66,
                        child: Text(
                          "${student.surname} ${student.name}",
                          style: AppTextStyles.labelLarge(context,
                              fontSize: 16.h, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Divider(color: AdaptiveTheme.of(context).theme.focusColor),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
