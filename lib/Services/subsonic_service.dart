import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class SubsonicService {
  String generateRandomString(int length) {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[random.nextInt(availableChars.length)]).join();

    return randomString;
  }

  String getSalt() {
    return generateRandomString(10);
  }

  Future<bool> authenticate(String baseURL,String username,String password) async {
    final String salt = getSalt();
    final String version = "1.16.1";//irgendwo anders herbekommen
    final String appName = "flatter";//irgendwo anders herbekommen
    String token = md5.convert(utf8.encode(password + salt)).toString();
    final uri = Uri.parse("");
  }
}