import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications_push/config/routes/app_router.dart';
import 'package:notifications_push/config/theme/app_theme.dart';
import 'package:notifications_push/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  // runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializerFirebaseNotifications();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationsBloc(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getThemeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
