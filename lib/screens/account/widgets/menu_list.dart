import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';
import '../../../widgets/custom_card.dart';
import 'menu_divider.dart';
import 'menu_data.dart';

/// Renders the list of menu options on the Profile account screen.
class MenuList extends StatelessWidget {
  final AccountProfile profile;

  const MenuList({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    const divider = MenuDivider();
    return Column(
      children: MenuData.buildSections(profile)
          .map(
            (items) => Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: CustomCard(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Column(
                  children:
                      items
                          .expand((item) => [item.toListItem(context), divider])
                          .toList()
                        ..removeLast(),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
