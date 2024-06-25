import 'package:emergency_test/features/history/bloc/history_bloc.dart';
import 'package:emergency_test/features/history/view/history_view.dart';
import 'package:emergency_test/repository/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  static String route = "/history_page_route";
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        historyRepository: context.read<HistoryRepository>(),
      )..add(HistoryInitRequested()),
      child: const HistoryView(),
    );
  }
}
