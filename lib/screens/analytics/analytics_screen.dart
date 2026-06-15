import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/analytics/analytics_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/analytics_body.dart';
import 'widgets/analytics_header.dart';

/// Screen exhibiting visualised business analytics and charts.
class AnalyticsScreen extends StatelessWidget {
  /// Creates a constant [AnalyticsScreen] widget.
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsBloc(
        analyticsRepository: context.read<AnalyticsRepository>(),
      )..add(const LoadAnalytics()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Column(
          children: const [
            AnalyticsHeader(),
            Expanded(child: AnalyticsBody()),
          ],
        ),
      ),
    );
  }
}
