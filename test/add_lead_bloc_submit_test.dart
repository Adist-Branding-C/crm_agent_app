import 'package:crm_agent_app/bloc/leads/add_lead/add_lead_bloc.dart';
import 'package:crm_agent_app/screens/leads/add_lead_error_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks/fake_leads_repository.dart';

void main() {
  group('AddLeadBloc Submission Tests', () {
    late AddLeadBloc bloc;
    late FakeLeadsRepository repository;

    setUp(() {
      repository = FakeLeadsRepository();
      bloc = AddLeadBloc(leadsRepository: repository);
    });
    tearDown(() => bloc.close());

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
        bloc.add(const SubmitForm());
      },
    );
  });
}
