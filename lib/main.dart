import 'package:najottalim_adminstration/app/bloc_observer.dart';
import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(App());
}
