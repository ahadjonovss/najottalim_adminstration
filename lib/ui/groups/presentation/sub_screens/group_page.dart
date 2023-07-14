import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class GroupPage extends StatelessWidget {
  GroupModel group;
  GroupPage({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: height(context) * 0.25,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(group.groupName, textAlign: TextAlign.start),
                background: Image.asset(
                  AppImages.najottalim3,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Column(
                      children: [
                        OnTap(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.addStudentToTheGroup,
                                arguments: group);
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
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                            color: AdaptiveTheme.of(context).theme.focusColor),
                        SizedBox(height: 6.h),
                        Text("list_of_students".tr,
                            style: AppTextStyles.labelLarge(context)),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
