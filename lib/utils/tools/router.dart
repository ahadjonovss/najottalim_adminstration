import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const authorization = 'authorization';
  static const home = 'home';
  static const login = 'login';
  static const addStudent = 'addStudent';
  static const addGroup = 'addGroup';
  static const addTeacher = 'addTeacher';
  static const group = 'group';
  static const addStudentToTheGroup = 'addStudentToGroupPage';
  static const teacherPage = 'teacherPage';
  static const addGroupToTeacher = 'addGroupToTeacher';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => MainPage());
      case RouteName.addStudent:
        return MaterialPageRoute(builder: (_) => AddStudentPage());
      case RouteName.addGroup:
        return MaterialPageRoute(builder: (_) => AddGroupsPage());
      case RouteName.teacherPage:
        return MaterialPageRoute(
            builder: (_) => TeacherPage(teacher: args as TeacherModel));
      case RouteName.addTeacher:
        return MaterialPageRoute(builder: (_) => AddTeacherPage());
      case RouteName.addGroupToTeacher:
        return MaterialPageRoute(
            builder: (_) =>
                AddGroupToTeacherPage(teacher: args as TeacherModel));
      case RouteName.addStudentToTheGroup:
        return MaterialPageRoute(
            builder: (_) => AddStudentToGroupPage(group: args as GroupModel));
      case RouteName.group:
        return MaterialPageRoute(
            builder: (_) => GroupPage(group: args as GroupModel));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
