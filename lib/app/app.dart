import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => StudentsBloc()..add(GetAllUsersEvent()))
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return AdaptiveTheme(
          builder: (light, dark) => GetMaterialApp(
            translations: AppTranslations(),
            locale: Locale("en", "EN"),

            //  locale: Locale(getIt<SettingsRepository>().getLanguage()=="ru"?"ru":"uz",getIt<SettingsRepository>().getLanguage()=="ru"?"RU":"UZ"),
            initialRoute: RouteName.splash,
            onGenerateRoute: AppRoutes.generateRoute,
            debugShowCheckedModeBanner: false,
            // home: Material(child: EnterInfoPage()),
            title: 'Bookmeri',
          ),
          light: AppTheme.light,
          initial: AdaptiveThemeMode.dark,
          dark: AppTheme.dark,
        );
      },
    );
  }
}
