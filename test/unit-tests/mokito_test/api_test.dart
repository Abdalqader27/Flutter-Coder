import 'package:flutter_test/flutter_test.dart';
import 'package:futter_coder/mokito_test/api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockitoExample extends Mock implements http.Client {}

void main() {
  late Api api;
  setUp(() {
    api = Api();
  });
  test('returns a Map if there is no error', () async {
    http.Client mockitoExample = MockitoExample();

    when(mockitoExample
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
        .thenAnswer((value) async {
      return http.Response('{"title": "Test"}', 200);
    });

    expect(await api.fetchFromDatabase(mockitoExample), isA<Map>());
  });
}
