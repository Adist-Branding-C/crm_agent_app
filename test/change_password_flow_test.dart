import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/widgets/user_avatar.dart';
import 'package:crm_agent_app/screens/change_password/change_password_screen.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Change Password screen flow test', (tester) async {
    await signInMockUser(tester);
    await tester.pumpAndSettle();

    expect(find.byType(UserAvatar), findsOneWidget);
    await tester.tap(find.byType(UserAvatar));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Change Password'));
    await tester.pumpAndSettle();

    expect(find.text('Keep your account secure'), findsOneWidget);
    final submit = find.widgetWithText(ElevatedButton, 'Update Password');
    expect(tester.widget<ElevatedButton>(submit).enabled, isFalse);

    final currentF = find.bySemanticsLabel('Current password Input Field');
    final newF = find.bySemanticsLabel('New password Input Field');
    final confirmF = find.bySemanticsLabel('Confirm new password Input Field');

    await tester.enterText(currentF, 'current123');
    await tester.enterText(newF, '123');
    await tester.pumpAndSettle();
    expect(find.text('Password must be at least 8 characters.'), findsOneWidget);

    await tester.enterText(newF, 'onlyletters');
    await tester.pumpAndSettle();
    expect(find.text('Password must include uppercase, lowercase, and numbers.'), findsOneWidget);

    await tester.enterText(newF, 'Password123');
    await tester.enterText(confirmF, 'Password124');
    await tester.pumpAndSettle();
    expect(find.text("Passwords don't match"), findsOneWidget);
    expect(tester.widget<ElevatedButton>(submit).enabled, isFalse);

    await tester.enterText(confirmF, 'Password123');
    await tester.pumpAndSettle();
    expect(tester.widget<ElevatedButton>(submit).enabled, isTrue);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Change Password'));
    await tester.pumpAndSettle();

    await tester.enterText(currentF, 'current123');
    await tester.enterText(newF, 'Password123');
    await tester.enterText(confirmF, 'Password123');
    await tester.pumpAndSettle();

    final ctx = tester.element(find.byType(ChangePasswordScreen));
    ScaffoldMessenger.of(ctx).clearSnackBars();
    await tester.pumpAndSettle();

    await tester.tap(submit);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
