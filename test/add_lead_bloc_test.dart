import 'package:crm_agent_app/bloc/leads/add_lead/add_lead_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddLeadBloc Real-Time Validation Tests', () {
    late AddLeadBloc bloc;
    setUp(() => bloc = AddLeadBloc());
    tearDown(() => bloc.close());

    test('initial state has empty fields, null errors, and is invalid', () {
      expect(bloc.state.name, '');
      expect(bloc.state.phone, '');
      expect(bloc.state.email, '');
      expect(bloc.state.nameError, null);
      expect(bloc.state.phoneError, null);
      expect(bloc.state.emailError, null);
      expect(bloc.state.isValid, false);
    });

    test('NameChanged validation checks length and alphabets only', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          predicate((AddLeadState s) => s.nameError == 'Name is required.'),
          predicate(
            (AddLeadState s) =>
                s.nameError ==
                'Please enter a valid name (alphabets only, minimum 3 characters).',
          ),
          predicate(
            (AddLeadState s) =>
                s.nameError ==
                'Please enter a valid name (alphabets only, minimum 3 characters).',
          ),
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
          predicate(
            (AddLeadState s) => s.phoneError == 'Phone number is required.',
          ),
          predicate(
            (AddLeadState s) =>
                s.phoneError == 'Please enter a valid 10-digit phone number.',
          ),
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
          predicate(
            (AddLeadState s) => s.emailError == 'Email address is required.',
          ),
          predicate(
            (AddLeadState s) =>
                s.emailError ==
                'Please enter a valid email address (e.g., example@domain.com).',
          ),
          predicate((AddLeadState s) => s.emailError == null),
        ]),
      );
      bloc.add(const EmailChanged(''));
      bloc.add(const EmailChanged('john@com'));
      bloc.add(const EmailChanged('john@example.com'));
    });

    test(
      'SubmitForm on valid state triggers submitting and success states',
      () {
        expectLater(
          bloc.stream,
          emitsInOrder([
            predicate(
              (AddLeadState s) =>
                  s.name == 'Rahul Menon' && s.nameError == null,
            ),
            predicate(
              (AddLeadState s) =>
                  s.phone == '9876543210' && s.phoneError == null,
            ),
            predicate(
              (AddLeadState s) =>
                  s.email == 'rahul@email.com' &&
                  s.emailError == null &&
                  s.isValid,
            ),
            predicate((AddLeadState s) => s.isSubmitting && !s.isSuccess),
            predicate(
              (AddLeadState s) =>
                  !s.isSubmitting &&
                  s.isSuccess &&
                  s.lead?.name == 'Rahul Menon',
            ),
          ]),
        );

        bloc.add(const NameChanged('Rahul Menon'));
        bloc.add(const PhoneChanged('9876543210'));
        bloc.add(const EmailChanged('rahul@email.com'));
        bloc.add(
          const SubmitForm(
            name: 'Rahul Menon',
            phone: '9876543210',
            email: 'rahul@email.com',
            location: 'Kochi',
            source: 'Facebook',
            purpose: 'Enquiry',
            category: 'Hot',
            status: 'New',
          ),
        );
      },
    );
  });
}
