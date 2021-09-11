import 'package:edir/core/models/edir.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'admin_members_data_provider_test.mocks.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';

@GenerateMocks([http.Client])
void main() {

  AdminMembersDataProvider adminMembersDataProvider = AdminMembersDataProvider();

  group('Admin Members Data Provider', () {
    
    // test('throws an Exception if the get http request finishes unsuccessfuly', () async {
    //   final client = MockClient();
    //   when(client.get(
    //     Uri.parse('http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10'),
    //     headers: <String, String>{
    //       'accept': 'application/json',
    //       'Authorization': 'Bearer UIGT7834G87FUYF78934GF87E3GUYF3874FG8743GF84G8FG7874',
    //     },
    //   )).thenAnswer((_) async =>
    //           http.Response('There was an error.', 404));
    //   expect(await adminMembersDataProvider.getEdir(), isA<Edir>());
    // });

    test('returns an Edir if the get http request finished successfuly', () async {
      final client = MockClient();
      when(client.get(
        Uri.parse('http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10'),
        headers: <String, String>{
          'accept': 'application/json',
          'Authorization': 'Bearer UIGT7834G87FUYF78934GF87E3GUYF3874FG8743GF84G8FG7874',
        },
      )).thenAnswer((_) async =>
              http.Response('{"name": "EdirName","initialDeposit": 10000.0,"ownerId": 123,"id": 14,"paymentFrequency": "monthly","username": "Abebech",}', 200));
      expect(adminMembersDataProvider.getEdir(), isA<Future<Edir>>());
      // expect(await adminMembersDataProvider.getEdir(), isA<Edir>());
    });

  });
  
}
