import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications_push/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (NotificationsBloc bloc) => Text(
            '${bloc.state.status}',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context
                    .read<NotificationsBloc>()
                    .requestPermissionToSendNotifications();
              },
              icon: const Icon(Icons.settings_rounded))
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
