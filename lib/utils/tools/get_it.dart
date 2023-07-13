import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => StudentsRepository());
}
