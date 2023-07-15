import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class GroupPage extends StatefulWidget {
  GroupModel group;
  GroupPage({required this.group, super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    context
        .read<GroupsBloc>()
        .add(GetGroupsStudentsEvent(widget.group.students));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height(context) * 0.25,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.group.groupName, textAlign: TextAlign.start),
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
                              arguments: widget.group);
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
                      SizedBox(height: 16.h),
                      BlocBuilder<GroupsBloc, GroupsState>(
                        builder: (context, state) {
                          if (state.groupsStudentsStatus ==
                              ResponseStatus.inSuccess) {
                            return SizedBox(
                              height: height(context) * 0.7,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => StudentItem(
                                    student: state.groupsStudents[index]),
                                itemCount: state.groupsStudents.length,
                              ),
                            );
                          }
                          return CircularProgressIndicator(
                              color: AdaptiveTheme.of(context).theme.cardColor);
                        },
                      )
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
