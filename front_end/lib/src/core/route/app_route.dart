import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/main_screen.dart';
import 'package:front_end/src/core/route/route_path.dart';
import 'package:front_end/src/features/timeoff/presentation/bloc/time_off_bloc.dart';
import 'package:front_end/src/features/timeoff/presentation/screen/time_off_home.dart';
import 'package:front_end/src/features/timeoff/presentation/screen/time_off_request_screen.dart';

import '../../../main.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/screen/login_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.logIn:
        return _materialRoute(
          BlocProvider<LoginCubit>(
            create: (_) => injector(),
            child: LoginScreen(key: UniqueKey()),
          ),
        );
      case RoutePaths.main:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: settings,
        );
      case RoutePaths.timeoffmain:
        return _materialRoute(
          BlocProvider<TimeOffCubit>(
            create: (_) => injector(),
            child: TimeOffHomeScreen(key: UniqueKey()),
          ),
        );
      case RoutePaths.timeoffrequest:
        return _materialRoute(
          BlocProvider<TimeOffCubit>(
            create: (_) => injector(),
            child: TimeOffRequestScreen(key: UniqueKey()),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: settings,
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => view,
    );
  }
}
