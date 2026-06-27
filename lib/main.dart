import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skill_bit/core/app_state/app_state_notifier.dart';
import 'package:skill_bit/core/router/app_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/di/injection_container.dart' as di;
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  print('DI INIT COMPLETE');
  print(
    'IS APP ROUTER REGISTERED RIGHT NOW: ${di.sl.isRegistered<AppRouter>()}',
  );
  final GoRouter router = di.sl<AppRouter>().router;
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider<AppStateNotifier>.value(
      value: di.sl<AppStateNotifier>(),
      child: BlocProvider<AuthBloc>(
        create: (final BuildContext context) => di.sl<AuthBloc>(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'SkillBit',
          theme: AppTheme.lightTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
