import 'package:test/test.dart';
import 'package:edir/core/models/user.dart';

void main() {
  group('Testing user model', () {
    
    var admin = User(
      fullName: 'Abebech Kebede',
      phone: '0911223344',
      role: 'a',
      id: 3345,
      email: 'abebech.kebede@gmail.com',
      password: 'a&3fg!@Gd43sdf#3#@',
    );

    test('Should be converted to json format', () {
      var jsn = admin.toJson();
      expect(jsn, {
        "full_name": 'Abebech Kebede',
        "phone": '0911223344',
        "role": 'a',
        "id": 3345,
        "email": 'abebech.kebede@gmail.com',
        "password": 'a&3fg!@Gd43sdf#3#@',
      });
    });    

    // test("Should copy all fields that aren't given", () {
    //   var user = admin.copyWith(
    //     role: 'u',
    //   );

    //   expect(user, User(
    //     fullName: 'Abebech Kebede',
    //     phone: '0911223344',
    //     role: 'u',
    //     id: 3345,
    //     email: 'abebech.kebede@gmail.com',
    //     password: 'a&3fg!@Gd43sdf#3#@',
    //   ));
    // });


  });
}