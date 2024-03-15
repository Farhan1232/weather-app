import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_Model.dart';

class repo {
  getweatherApp(String? city) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=07b4fd06d27594cd1cf74ef294a65693';
    final res = await http.get(Uri.parse(url));
    var resbody = res.body;

    try {
      if (res.statusCode == 200) {
        return weatherModel.fromJson(jsonDecode(resbody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
