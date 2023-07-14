import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class SelectableGroupItem extends StatelessWidget {
  TeacherModel teacher;
  GroupModel group;
  VoidCallback onTap;
  bool isSelected;
  SelectableGroupItem(
      {required this.isSelected,
      required this.teacher,
      required this.onTap,
      required this.group,
      super.key});

  @override
  Widget build(BuildContext context) {
    return teacher.groupIds.contains(group.groupId)
        ? Container()
        : OnTap(
            onTap: onTap,
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
                          group.groupName,
                          style: AppTextStyles.labelLarge(context,
                              fontSize: 16.h, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          // onTap;
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Divider(color: AdaptiveTheme.of(context).theme.focusColor),
                ],
              ),
            ),
          );
  }
}
