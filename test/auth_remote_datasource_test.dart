import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/data/datasources/auth_remote_datasource.dart';

class MockAdapter implements HttpClientAdapter {
  ResponseBody Function(RequestOptions options)? handler;
  @override
  Future<ResponseBody> fetch(
    RequestOptions o,
    Stream<Uint8List>? s,
    Future<void>? c,
  ) async => handler != null ? handler!(o) : ResponseBody.fromString('', 404);
  @override
  void close({bool force = false}) {}
}

void main() {
  test('AuthRemoteDataSourceImpl unit tests', () async {
    final dio = Dio();
    final mockAdapter = MockAdapter();
    dio.httpClientAdapter = mockAdapter;
    final datasource = AuthRemoteDataSourceImpl(dio: dio);

    // 1. Success response (200)
    mockAdapter.handler = (_) => ResponseBody.fromString(
      jsonEncode({
        'success': true,
        'message': 'Login successful',
        'data': {
          'token': 'fake_jwt_token',
          'user': {'phone': '1234567890', 'name': 'John Doe'},
        },
      }),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    final result = await datasource.login('1234567890', 'password123');
    expect(result.success, isTrue);
    expect(result.token, 'fake_jwt_token');
    expect(result.user.name, 'John Doe');

    // 2. Invalid credentials (200 with success false)
    mockAdapter.handler = (_) => ResponseBody.fromString(
      jsonEncode({'success': false, 'message': 'Invalid phone or password'}),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    await expectLater(
      datasource.login('1234567890', 'wrong_password'),
      throwsA(isA<InvalidCredentialsException>()),
    );

    // 3. Bad request 400
    mockAdapter.handler = (_) => ResponseBody.fromString(
      jsonEncode({
        'success': false,
        'message': 'Phone and password are required',
      }),
      400,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    await expectLater(
      datasource.login('', ''),
      throwsA(isA<InvalidCredentialsException>()),
    );

    // 4. Network exception
    mockAdapter.handler = (o) => throw DioException(
      requestOptions: o,
      type: DioExceptionType.connectionTimeout,
    );
    await expectLater(
      datasource.login('123', 'pw'),
      throwsA(isA<NetworkException>()),
    );
  });
}
