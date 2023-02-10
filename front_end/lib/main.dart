import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/main_screen.dart';
import 'package:front_end/src/core/route/app_route.dart';
import 'package:front_end/src/core/route/route_path.dart';
import 'package:front_end/src/features/login/data/repository/login_repo_impl.dart';
import 'package:front_end/src/features/login/domain/repository/login_repo.dart';
import 'package:front_end/src/features/login/domain/usecase/login_use_case.dart';
import 'package:front_end/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:front_end/src/features/login/presentation/screen/login_screen.dart';
import 'package:front_end/src/features/timeoff/data/repo/time_off_repo_impl.dart';
import 'package:front_end/src/features/timeoff/domain/repo/time_off_repo.dart';
import 'package:front_end/src/features/timeoff/domain/usecase/create_time_off_use_case.dart';
import 'package:front_end/src/features/timeoff/domain/usecase/read_time_off_use_case.dart';
import 'package:front_end/src/features/timeoff/presentation/bloc/time_off_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF337A5B,
          <int, Color>{
            50: Color(0xFF337A5B),
            100: Color(0xFF337A5B),
            200: Color(0xFF337A5B),
            300: Color(0xFF337A5B),
            400: Color(0xFF337A5B),
            500: Color(0xFF337A5B),
            600: Color(0xFF337A5B),
            700: Color(0xFF337A5B),
            800: Color(0xFF337A5B),
            900: Color(0xFF337A5B),
          },
        ),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? RoutePaths.main
          : RoutePaths.logIn,
    );
  }
}

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Repository
  injector.registerFactory<LoginRepo>(() => LoginRepoImpl());
  injector.registerFactory<TimeOffRepo>(() => TimeOffRepoImpl());
  //Use cases
  injector.registerFactory(() => LoginUseCase(injector()));
  injector.registerFactory(() => CreateTimeOffUseCase(injector()));
  injector.registerFactory(() => ReadTimeOffUseCase(injector()));
  //Bloc
  injector.registerFactory<LoginCubit>(() => LoginCubit(injector()));
  injector.registerFactory<TimeOffCubit>(() => TimeOffCubit(injector(), injector()));
}
