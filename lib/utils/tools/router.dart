import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const authorization = 'authorization';
  static const home = 'home';
  static const login = 'login';
  static const addStudent = 'addStudent';
  static const addGroup = 'addGroup';
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
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
