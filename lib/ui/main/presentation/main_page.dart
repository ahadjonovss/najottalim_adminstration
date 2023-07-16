import 'package:najottalim_adminstration/ui/groups/presentation/groups_page.dart';
import 'package:najottalim_adminstration/ui/students/presentation/students_page.dart';
import 'package:najottalim_adminstration/ui/teachers/presentation/teachers_page.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          title: Image.asset(
            AppImages.Logo,
            fit: BoxFit.fitHeight,
            height: 40,
          ),
        ),
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(height: 12.h),
                TabBar(
                  tabs: [
                    Tab(
                        child: Icon(Icons.person,
                            color: AdaptiveTheme.of(context).theme.cardColor)),
                    Tab(
                        child: Icon(Icons.book,
                            color: AdaptiveTheme.of(context).theme.cardColor)),
                    Tab(
                        child: Icon(Icons.group,
                            color: AdaptiveTheme.of(context).theme.cardColor)),
                  ],
                  indicatorColor: AdaptiveTheme.of(context).theme.cardColor,
                ),
                SizedBox(height: 16.h),
                const Expanded(
                  child: TabBarView(children: [
                    StudentsPage(),
                    TeachersPage(),
                    GroupsPage(),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
