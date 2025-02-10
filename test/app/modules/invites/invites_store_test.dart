import 'package:flutter_test/flutter_test.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
 
void main() {
  late InvitesStore store;

  setUpAll(() {
    store = InvitesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}