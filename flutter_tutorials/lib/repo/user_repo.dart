import 'package:flutter_tutorials/model/users.dart';
import 'package:flutter_tutorials/utils/constants.dart';
import 'package:http/http.dart';

class UserRepo {
  Future<List<User>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    }
    throw Exception(response.reasonPhrase);
  }
}
