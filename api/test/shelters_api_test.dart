import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SheltersApi
void main() {
  final instance = Openapi().getSheltersApi();

  group(SheltersApi, () {
    // 무더위쉼터 목록 조회
    //
    //Future<ApiSheltersGet200Response> apiSheltersGet({ num latitude, num longitude, num radius }) async
    test('test apiSheltersGet', () async {
      // TODO
    });

  });
}
