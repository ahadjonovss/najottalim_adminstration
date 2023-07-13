import 'package:najottalim_adminstration/ui/groups/presentation/groups_page.dart';
import 'package:najottalim_adminstration/ui/students/presentation/students_page.dart';
import 'package:najottalim_adminstration/ui/teachers/presentation/teachers_page.dart';
import 'package:najottalim_adminstration/utils/constants/app_images.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          title: Image.asset(
            AppImages.Logo,
            fit: BoxFit.fitHeight,
            height: 40,
          ),
        ),
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        body: const SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(child: Icon(Icons.person)),
                  Tab(child: Icon(Icons.book)),
                  Tab(child: Icon(Icons.group)),
                ]),
                Expanded(
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
