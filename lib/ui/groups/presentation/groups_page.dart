import 'package:najottalim_adminstration/ui/groups/bloc/groups_bloc/groups_bloc.dart';
import 'package:najottalim_adminstration/ui/groups/presentation/widgets/group_item.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

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
                Navigator.pushNamed(context, RouteName.addGroup);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.group_add_sharp,
                    size: 32.h,
                    color: AppColors.c006ED1,
                  ),
                  SizedBox(width: 12.h),
                  Text("Add Group",
                      style: AppTextStyles.labelLarge(context,
                          fontSize: 16.h, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Divider(color: AdaptiveTheme.of(context).theme.focusColor),
            SizedBox(height: 12.h),
            BlocProvider(
              create: (context) => GroupsBloc()..add(GetAllGroupsEvent()),
              child: BlocBuilder<GroupsBloc, GroupsState>(
                builder: (context, state) {
                  if (state.status == ResponseStatus.inSuccess) {
                    List<GroupModel> groups = state.groups;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: groups.length,
                        itemBuilder: (context, index) =>
                            GroupItem(group: groups[index]));
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
