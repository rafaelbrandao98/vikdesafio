import 'package:flutter_test/flutter_test.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
 
void main() {
  late EnterpriseStore store;

  setUpAll(() {
    store = EnterpriseStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}