import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class TeacherPage extends StatefulWidget {
  TeacherModel teacher;
  TeacherPage({required this.teacher, super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  void initState() {
    context
        .read<TeachersBloc>()
        .add(GetTeachersGroupsEvent(widget.teacher.groupIds));
    super.initState();
  }

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
                title: Text("${widget.teacher.name} ${widget.teacher.surname}",
                    textAlign: TextAlign.start),
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
                                context, RouteName.addGroupToTeacher,
                                arguments: widget.teacher);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.group_add,
                                size: 32.h,
                                color: AppColors.c006ED1,
                              ),
                              SizedBox(width: 12.h),
                              Text("add_group".tr,
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
                        Text("list_of_groups".tr,
                            style: AppTextStyles.labelLarge(context)),
                        SizedBox(height: 16.h),
                        BlocBuilder<TeachersBloc, TeachersState>(
                          builder: (context, state) {
                            if (state.groupsStatus ==
                                ResponseStatus.inSuccess) {
                              return ListView.builder(
                                itemBuilder: (context, index) =>
                                    GroupItem(group: state.groups[index]),
                                shrinkWrap: true,
                                itemCount: state.groups.length,
                              );
                            }
                            return Container();
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
      ),
    );
  }
}
