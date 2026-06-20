import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/page_scaffold.dart';
import 'models/deals_view_notifier.dart';
import 'widgets/deals_async_handler.dart';
import 'widgets/deals_content.dart';
import 'widgets/deals_toggle.dart';

/// The main Deals Screen.
class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DealsViewNotifier(0),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const DealsAsyncHandler(),
            const DealsToggle(),
            const Expanded(child: DealsContent()),
          ],
        ),
      ),
    );
  }
}
