import 'package:crm_agent_app/bloc/leads/add_lead/add_lead_bloc.dart';
import 'package:crm_agent_app/screens/leads/add_lead_error_extensions.dart';
import 'package:crm_agent_app/data/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks/fake_leads_repository.dart';

void main() {
  group('AddLeadBloc Real-Time Validation Tests', () {
    late AddLeadBloc bloc;
    late FakeLeadsRepository repository;

    setUp(() {
      repository = FakeLeadsRepository();
      bloc = AddLeadBloc(leadsRepository: repository);
    });
    tearDown(() => bloc.close());

    test('initial state has empty fields, null errors, and is invalid', () {
      expect(bloc.state.name, '');
      expect(bloc.state.phone, '');
      expect(bloc.state.email, '');
      expect(bloc.state.nameError, null);
      expect(bloc.state.phoneError, null);
      expect(bloc.state.emailError, null);
      expect(bloc.state.isValid, false);
      expect(bloc.state.isSubmitting, false);
      expect(bloc.state.isSuccess, false);
    });

    test('NameChanged validation checks length and alphabets only', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          predicate((AddLeadState s) => s.nameError == AppStrings.leadNameRequired),
          predicate((AddLeadState s) => s.nameError == AppStrings.leadNameInvalid),
          predicate((AddLeadState s) => s.nameError == AppStrings.leadNameInvalid),
          predicate((AddLeadState s) => s.nameError == null),
        ]),
      );
      bloc.add(const NameChanged(''));
      bloc.add(const NameChanged('Jo'));
      bloc.add(const NameChanged('John123'));
      bloc.add(const NameChanged('John Doe'));
    });

    test('PhoneChanged validation checks length and digits only', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          predicate((AddLeadState s) => s.phoneError == AppStrings.leadPhoneRequired),
          predicate((AddLeadState s) => s.phoneError == AppStrings.leadPhoneInvalid),
          predicate((AddLeadState s) => s.phoneError == null),
        ]),
      );
      bloc.add(const PhoneChanged(''));
      bloc.add(const PhoneChanged('98765'));
      bloc.add(const PhoneChanged('9876543210'));
    });

    test('EmailChanged validation checks email regex pattern', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          predicate((AddLeadState s) => s.emailError == AppStrings.leadEmailRequired),
          predicate((AddLeadState s) => s.emailError == AppStrings.leadEmailInvalid),
          predicate((AddLeadState s) => s.emailError == null),
        ]),
      );
      bloc.add(const EmailChanged(''));
      bloc.add(const EmailChanged('john@com'));
      bloc.add(const EmailChanged('john@example.com'));
    });
  });
}
