import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../bloc/deals/deals_bloc.dart';
import '../../widgets/page_scaffold.dart';
import 'models/deals_view_notifier.dart';
import 'widgets/deals_async_handler.dart';
import 'widgets/deals_content.dart';
import 'widgets/deals_toggle.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DealsBloc(dealsRepository: context.read())
        ..add(const LoadDeals()),
      child: ChangeNotifierProvider(
        create: (_) => DealsViewNotifier(0),
        child: PageScaffold(
          padding: EdgeInsets.zero,
          child: const Column(
            children: [
              DealsAsyncHandler(),
              DealsToggle(),
              Expanded(child: DealsContent()),
            ],
          ),
        ),
      ),
    );
  }
}
